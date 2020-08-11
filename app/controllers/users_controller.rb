require 'json'
require 'open-uri'

class UsersController < ApplicationController
   skip_before_action :verify_authenticity_token, :only => :handle_steam_login   

   $frontend = ENV['RAILS_ENV'] == 'development' ? 'http://localhost:3001' : 'http://www.rollindeuce.online/'
   def handle_steam_login
     # binding.pry
     user_steam_data = request.env['omniauth.auth']
                              .as_json["extra"]["raw_info"]
                              .as_json
                              .except("profilestate", "communityvisibilitystate", "commentpermission", "avatarhash", "avatar", "avatarmedium", "personastate", "timecreated", "personastateflags")
      steamId64 = user_steam_data['steamid']
      user_steam_data['steamID'] = get_steam_ID(steamId64.to_i)
      if User.find_by(steamID: user_steam_data['steamID'])
         update_user!(user_steam_data)
         user_steam_data['m_type'] = 'none' unless @user.moder? || @user.superadmin?

         if @user.moder? || @user.superadmin?
            token = @user.generate_auth_token!
            user_steam_data['auth_token'] = token
            user_steam_data['m_type'] = @user.superadmin? ? 'ceo' : (Moder.find_by(id: @user.id)&.m_type || 'no')
         end
      else
         register_user!(user_steam_data)
      end

      redirect_to("#{$frontend}?steam_data=#{user_steam_data.to_json}")
   end

   def refresh_user_data
      url = "https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v2/?key=#{ENV['STEAM_WEB_API_KEY']}&format=json&steamids=#{params[:steam_id64]}"
      response = JSON.parse(open(url).read)
      name = response["response"]["players"].first["personaname"]
      User.find_by(steamID64: params[:steam_id64]).update(nickname: name)
      render json: {name: name}
   end

   def get_steam_ID(steamID64)
      steamID = (steamID64 - (76561197960265728 + (steamID64% 2))) / 2
      "STEAM_1:#{steamID64%2}:#{steamID}"
   end

   def register_user!(user_steam_data)
      @user = User.create!(
                  nickname: user_steam_data['personaname'],
                  steamID: user_steam_data['steamID'],
                  steamID64: user_steam_data['steamid'],
                  profile_url: user_steam_data['profileurl'],
                  avatar_url: user_steam_data['avatarfull'],
                  email: Faker::Internet.email,
                  password: Faker::Internet.password,
                  role: 0
               )
   end

   def update_user!(user_steam_data)
      User.find_by(steamID: user_steam_data['steamID']).update(
         nickname: user_steam_data['personaname'],
         steamID: user_steam_data['steamID'],
         steamID64: user_steam_data['steamid'],
         profile_url: user_steam_data['profileurl'],
         avatar_url: user_steam_data['avatarfull']
      )
      @user = User.find_by(steamID: user_steam_data['steamID'])
   end

   def get_m_points
      user = User.find_by(steamID: params[:steam_id])
      return render json: {m_points: user.m_points}
   end


   def get_administration
      ceo = User.superadmin.first
      cto = User.cto.first
      main_moder = Moder.where(m_type: 'main').first
      contest_moder = Moder.where(m_type: 'contest').first
      ruler_moder = Moder.where(m_type: 'ruler').first
      return render json: {admins: [ceo, cto], moders: [main_moder, contest_moder, ruler_moder]}
   end
end
 