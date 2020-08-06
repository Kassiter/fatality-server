require 'net/ftp'

class LogsController < ApplicationController
   skip_before_action :verify_authenticity_token 

   def pull_log!
      return render json: {error: 'Too early'}, status: 400 if DateTime.now.strftime("%H").to_i < 17
      return render json: {error: 'Already pulled'}, status: 400 unless Log.where(on_date: Date.today).last.nil?

      ftp = Net::FTP.new
      ftp.connect('91.211.118.15', '21')
      ftp.login('s26836', '261383')
      logfile_name = "console.log"
      f = ftp.getbinaryfile(logfile_name, logfile_name)
      

      log = ""
      File.open(logfile_name, "r") do |f|
         f.each_line do |line|
            if line.include?("<STEAM_") && line.include?("#{Date.today.strftime('%m/%d/%Y')}") && !line[/Console<|T-double-U|STEAM_1:1:153969439|connected|entered the game/].present?
               log+=line
            end
         end
      end


      files = ftp.chdir('addons/sourcemod/logs')
      logfile_name = "L#{Date.today.strftime("%Y%m%d")}.log"
      f = ftp.getbinaryfile(logfile_name, logfile_name)
      ftp.close

      File.open(logfile_name, "r") do |f|
         f.each_line do |line|
            if line.include?("<STEAM_") && !line[/Console<|T-double-U|STEAM_1:1:153969439|connected|entered the game|threw|entindex|committed|switched from|killed other|func_|kjrqht/].present?
               log+=line
            end
         end
      end

      log = log.split("\n").uniq.join("\n")

      Log.create!(text: log, on_date: Date.today, reported_rows: [-1])
      File.delete(logfile_name) if File.exist?(logfile_name)

      return render json: {status: 200}, status: 200
   end

   def show_log
      authorize!
      result = Log.where(on_date: Date.today).last.as_json

      return render json: {log: result}, status: 200
   end

   def report_rows
      authorize!
      log = Log.where(on_date: Date.today, reported: false).last
      return render json: {error: 'Log already reported or doesn\'t exist'}, status: 400 if log.nil?

      update = log.update(text: params[:rows], reported: true)

      render json: {status: 200}, status: 200 if update
   end

   def authorize!
      user = User.find_by(steamID: params[:steamID])
      return render json: {error: 'Bad request'}, status: 400 if user.nil? 

      return render json: {error: 'Unauthorized'}, status: 401  unless user.moder? && user.auth_token_valid?(params[:auth_token]) && Moder.find_by(id: user.id).ruler?
   end
end