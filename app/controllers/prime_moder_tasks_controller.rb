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

   def authorize!
      user = User.find_by(steamID: params[:steamID])
      return render json: {error: 'Unauthorized'}, status: 401  unless (( user.moder? && Moder.find_by(id: user.id).main?) || user.superadmin? ) && user.auth_token_valid?(params[:auth_token]) && user.present?
   end
end