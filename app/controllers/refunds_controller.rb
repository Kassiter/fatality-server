class RefundsController < ApplicationController
   skip_before_action :verify_authenticity_token

   def participating
      user = User.find_by(steamID: params[:steam_id])
      return render json: { error: "Invalid SteamID", status: 400 }, status: 400 unless user

      part = user.refund.present?
      render json: {participating: part}, status: 200
   end

   def apply_form
      user = User.find_by(steamID: params[:user][:steam_id])
      return render json: { error: "Invalid SteamID", status: 400 }, status: 400 unless user

      Refund.create!(
         user_id: user.id,
         when_buyed: params[:when_buyed],
         buyer_nickname: params[:buyer_nickname],
         priviliege_type: params[:priviliege_type],
         proofs: params[:proofs]
      )

      render json: {status: 201}, status: 201
   end
end