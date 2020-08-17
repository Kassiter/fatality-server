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
      uploaded_io = params["file"]
      filename = uploaded_io.original_filename
      folder = filename.split('.zip').first
      File.open(Rails.root.join('tmp', uploaded_io.original_filename), 'wb') do |file|
         file.write(uploaded_io.read)
      end
      %x( ./bzippify.sh #{filename} #{folder})

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

      File.delete("tmp/#{filename}")
      FileUtils.rm_rf("tmp/#{folder}")
   end

   def authorize!
      user = User.find_by(steamID: params[:steamID])
      return render json: {error: 'Unauthorized'}, status: 401  unless (( user.moder? && Moder.find_by(id: user.id).main?) || user.superadmin? ) && user.auth_token_valid?(params[:auth_token]) && user.present?
   end

   def authorize_cto!
      user = User.find_by(steamID: params[:steamID])
      return render json: {error: 'Unauthorized'}, status: 401  unless (user.cto? || user.superadmin? ) && user.auth_token_valid?(params[:auth_token]) && user.present?
   end
end