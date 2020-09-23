class ContestKeysController < ApplicationController
   skip_before_action :verify_authenticity_token

   # def index_keys
   #    authorize!
   #    done = ContestKey.where(on_date: Date.today).where.not(report: "").count == 5
   #    return render json: {keys: ContestKey.where(on_date: Date.today).last(5).as_json, all_done: done}
   # end

   # def submit_report
   #    authorize!
   #    result = ContestKey.find_by(id: params[:id]).update(
   #       report: params[:report]
   #    )

   #    return render json: {error: 'Bad request'}, status: 400 unless result
   # end

   # def generate_keys
   #    authorize!

   #    return render json: {error: 'Keys already exist'}, status: 400 if ContestKey.where(on_date: Date.today).last.present?
   #    5.times do 
   #       key = Devise.friendly_token.slice(0, 20).gsub(/[_&*]/, '-')
   #       key_ent = ContestKey.create!(key: key, on_date: Date.today)
   #       PrevilegiesKey.create!(
   #          key_name: key_ent.key,
   #          type: "shop_credits",
   #          expires: 0,
   #          uses: 1,
   #          sid: 0,
   #          param1: "6000"
   #       )
   #    end

   #    render json: ContestKey.where(on_date: Date.today).last(5).as_json
   # end

   # def authorize!
   #    user = User.find_by(steamID: params[:steamID])
   #    return render json: {error: 'Unauthorized'}, status: 401  unless (( user.moder? && Moder.find_by(id: user.id).contest? ) || user.superadmin?) && user.auth_token_valid?(params[:auth_token]) && user.present?
   # end
end