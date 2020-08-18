require 'net/ftp'
require 'fileutils'

class PrimeModerTasksController < ApplicationController
   skip_before_action :verify_authenticity_token

   def get_task
      authorize!
      return render json: {task: PrimeModerTask.where(report: nil).or(PrimeModerTask.where(report: '')).last.as_json}
   end

   def submit_report
      authorize!
      result = PrimeModerTask.find_by(id: params[:id]).update(
         report: params[:report]
      )

      return render json: {error: 'Bad request'}, status: 400 unless result
      return render json: {status: 'Success'}, status: 201 if result
   end

   def upload_skin
      authorize_cto!

      uploaded_io = params["file"]
      filename = uploaded_io.original_filename
      folder = filename.split('.zip').first
      File.open(Rails.root.join('tmp', uploaded_io.original_filename), 'wb') do |file|
         file.write(uploaded_io.read)
      end

      %x( ./bzippify.sh #{filename} #{folder})
      dlist_file = Dir.glob("tmp/#{folder}/**/*").grep(/.txt/).first
      dlist = File.read(dlist_file)
      File.delete(dlist_file)
      

      ftp = Net::FTP.new
      ftp.connect('91.211.118.15', '21')
      ftp.login('s26836', '261383')
      entries = Dir.glob("tmp/#{folder}/**/*").sort
      entries.each do |name|
         if File::directory? name
           ftp.mkdir name.gsub("tmp/#{folder}/", "") rescue nil
         else
           File.open(name) { |file| ftp.putbinaryfile(file, name.gsub("tmp/#{folder}/", "")) rescue nil }
         end
      end
      files = ftp.chdir('addons/sourcemod/configs/shop')
      f = ftp.getbinaryfile('skins_downloads.txt', './tmp/skins_downloads.txt')
      open('./tmp/skins_downloads.txt', 'a') do |f|
         f.puts dlist
      end

      ftp.delete('skins_downloads.txt')
      File.open('./tmp/skins_downloads.txt') { |file| ftp.putbinaryfile(file, './skins_downloads.txt') rescue nil }

      f = ftp.getbinaryfile('skins.txt', './tmp/skins.txt')

      insert_lines_following_line( "./tmp/skins.txt", 3 ) do |outf|
         outf.puts generate_shop_data(dlist)
      end

      ftp.delete('skins.txt')
      File.open('./tmp/skins.txt') { |file| ftp.putbinaryfile(file, './skins.txt') rescue nil }
      
      File.rename("./tmp/skins_downloads.txt", "./tmp/skins_downloads_#{DateTime.now.strftime("%H_%M-%d-%m-%y-%s")}.txt")
      File.rename("./tmp/skins.txt", "./tmp/skins_#{DateTime.now.strftime("%H_%M-%d-%m-%y-%s")}.txt")
      File.delete("tmp/#{filename}")
      FileUtils.rm_rf("tmp/#{folder}")
      return render json: {status: 200}, status: 200
   end

   def authorize!
      user = User.find_by(steamID: params[:steamID])
      return render json: {error: 'Unauthorized'}, status: 401  unless (( user.moder? && Moder.find_by(id: user.id).main?) || user.superadmin? ) && user.auth_token_valid?(params[:auth_token]) && user.present?
   end

   def authorize_cto!
      user = User.find_by(steamID: params[:steamID])
      return render json: {error: 'Unauthorized'}, status: 401  unless (user.cto? || user.superadmin? ) && user.auth_token_valid?(params[:auth_token]) && user.present?
   end

   def generate_shop_data(dlist)
      model_path = dlist.split("\n").grep(/.mdl/).filter {|s| !s.include?('arms')}.first.gsub("\r", "")
      "\"#{params[:model_name]}\"\n
      {\n
         \"name\"	\"#{params[:model_name]}\"\n
         \"description\"	\"\"\n
         \"ModelT\"        \"#{params[:model_team] == 't' ? model_path : ''}\"\n
         \"ModelCT\"        \"#{params[:model_team] == 'ct' ? model_path : ''}\"\n
         \"price\"			\"#{params[:model_price]}\"\n
         \"sell_price\"	\"-1\"\n
         \"color\"			\"255 255 255 255\"\n
         \"duration\"		\"0\"\n 
      }\n"
   end

   def insert_lines_following_line file, line_no
      tmp_fn = "#{file}.tmp"
      File.open( tmp_fn, 'a+' ) do |outf|
        line_ct = 0
        IO.foreach(file) do |line|
          outf.print line
          yield(outf) if line_no == (line_ct += 1)
        end
      end
      File.rename tmp_fn, file
    end
end