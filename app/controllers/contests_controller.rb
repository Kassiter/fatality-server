class ContestsController < ApplicationController
   def index
      contest = Contest.where('due_date > ?', DateTime.now).last
      return render json: {contest: nil} if contest.nil?
     
      contest_id = contest.id
      contest = contest.as_json
      user = User.find_by(steamID: params[:steam_id])
      participating = ContestsUser.find_by(user_id: user.id, contest_id: contest_id).present?
      contest[:participating] = participating
      render json: {contest: contest}
   end

   def take_part
      ActiveRecord::Base.transaction do
         user = User.find_by(steamID: params[:steam_id])
         contest = Contest.find(params[:contest_id])
         return render json: { error: "Неверный SteamID", status: 400 }, status: 400 unless user && contest

         user_contest = UsersContest.create!(
                           user_id: user.id,
                           contest_id: contest.id
                        )
         render json: { status: 201 }, status: 201 if user_contest
      end
   end
end