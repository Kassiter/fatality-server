class PersonalItemsController < ApplicationController
   before_action :set_personal_item, only: [:show, :edit, :update, :destroy]
   skip_before_action :verify_authenticity_token  
 
   # GET /personal_items
   # GET /personal_items.json
   def index
     render json: PersonalItem.all.sort_by(&:created_at).as_json
   end
 
   # GET /personal_items/1
   # GET /personal_items/1.json
   def show
   end
 
   # GET /personal_items/new
   def new
     @personal_item = PersonalItem.new
   end
 
   # GET /personal_items/1/edit
   def edit
   end
 
   # POST /personal_items
   # POST /personal_items.json
   def create
     @personal_item = PersonalItem.new(personal_item_params)
 
     respond_to do |format|
       if @personal_item.save
         format.html { redirect_to @personal_item, notice: 'Personal feature was successfully created.' }
         format.json { render :show, status: :created, location: @personal_item }
       else
         format.html { render :new }
         format.json { render json: @personal_item.errors, status: :unprocessable_entity }
       end
     end
   end
 
   # PATCH/PUT /personal_items/1
   # PATCH/PUT /personal_items/1.json
   def update
     respond_to do |format|
       if @personal_item.update(personal_item_params)
         format.html { redirect_to @personal_item, notice: 'Personal feature was successfully updated.' }
         format.json { render :show, status: :ok, location: @personal_item }
       else
         format.html { render :edit }
         format.json { render json: @personal_item.errors, status: :unprocessable_entity }
       end
     end
   end
 
   # DELETE /personal_items/1
   # DELETE /personal_items/1.json
   def destroy
     @personal_item.destroy
     respond_to do |format|
       format.html { redirect_to personal_items_url, notice: 'Personal feature was successfully destroyed.' }
       format.json { head :no_content }
     end
   end

   def request_item
    ActiveRecord::Base.transaction do
      return render json: { error: "Неверный ключ", status: 400 }, status: 400 unless key_valid?
        
      item = PersonalItem.find_by(key: params[:key])
      item.update(
        description: params[:description],
        used: true
      )
      
      user = User.find_by(steamID: params['user']['steamID'])

      return render json: { error: "Invalid SteamID", status: 400 }, status: 400 unless user

      user.update(email: params['user']['email'])
      
      item.user = user
      item.save!

      UserMailer.with(user: user).personal_item_email.deliver_now
      trat = User.find_by(email: "trat.westerholt@gmail.com")

      UserMailer.with(trat: trat, user: user, key: item.key).personal_item_purchased.deliver_now
      render json: {
        status: 200
      }, status: 200
    end
   end

   def key_valid?
    PersonalItem.find_by(key: params[:key]).present? && !PersonalItem.find_by(key: params[:key]).try(:used)
   end
 
   private
     # Use callbacks to share common setup or constraints between actions.
     def set_personal_item
       @personal_item = PersonalItem.find(params[:id])
     end
 
     # Only allow a list of trusted parameters through.
     def personal_item_params
       params.fetch(:personal_item, {})
     end
 end
 