class ModerContestsController < ApplicationController
   skip_before_action :verify_authenticity_token 

   def index
      contest = ModerContest.where('due_date > ?', DateTime.now).last
      user = User.find_by(steamID: params[:steam_id])
      winner = ModerContestsUser.where(user_id: user.id).last.try(:winner) || false
      return render json: {contest: nil, winner: winner} if contest.nil?
      contest_id = contest.id
      contest = contest.as_json
      contest["due_date"] = contest["due_date"].to_date.strftime("%d.%m.%y")
      participating = ModerContestsUser.find_by(user_id: user.id, moder_contest_id: contest_id).present?
      contest["participating"] = participating
      render json: {contest: contest}
   end

   def take_part
      ActiveRecord::Base.transaction do
         user = User.find_by(steamID: params[:user][:steamID])
         moder_contest = ModerContest.find(params[:moder_contest_id])
         return render json: { error: "Неверный SteamID", status: 400 }, status: 400 unless user && moder_contest

         user_moder_contest = ModerContestsUser.create!(
                                 user_id: user.id,
                                 moder_contest_id: moder_contest.id,
                                 age: params[:age],
                                 experience: params[:experience],
                                 reason: params[:reason],
                                 winner: false
                              )
         render json: { status: 201 }, status: 201 if user_moder_contest
      end
   end
end
