class ManageCommandCategoriesController < ApplicationController
   skip_before_action :verify_authenticity_token 

   def mc_categories
      authorize!

      @mcc = ManageCommandCategory.all.to_a
      @mcc.each_with_index do |category, i|
         commands = category.manage_commands
         @mcc[i] = category.as_json
         @mcc[i]["commands"] = commands.as_json
      end
      return render json: {categories: @mcc}, status: 200 if @mcc
   end

   def decorate
      @mcc.each do |category|
         commands = category.manage_commands
         category = category.as_json
         category["commands"] = commands
      end
   end

   def authorize!
      user = User.find_by(steamID: params[:steamID])
      return render json: {error: 'Bad request'}, status: 400 if user.nil? 

      return render json: {error: 'Unauthorized'}, status: 401  unless user.admin? && user.auth_token_valid?(params[:auth_token])
   end
end