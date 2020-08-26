require 'digest/bubblebabble'

class PriviliegesController < ApplicationController
  before_action :set_priviliege, only: [:show, :edit, :update, :destroy]

  # GET /privilieges
  # GET /privilieges.json
  def index
    @privilieges = Priviliege.all
  end

  def get_privilieges
    render json: JSON.parse(Priviliege.joins(:privilieges_features).sort_by(&:created_at).to_json(include: :privilieges_features)).uniq
  end

  # GET /privilieges/1
  # GET /privilieges/1.json       
  def show
  end

  # GET /privilieges/new
  def new
    @priviliege = Priviliege.new
  end

  # GET /privilieges/1/edit
  def edit
  end

  # POST /privilieges
  # POST /privilieges.json
  def create
    @priviliege = Priviliege.new(priviliege_params)

    respond_to do |format|
      if @priviliege.save
        format.html { redirect_to @priviliege, notice: 'Priviliege was successfully created.' }
        format.json { render :show, status: :created, location: @priviliege }
      else
        format.html { render :new }
        format.json { render json: @priviliege.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /privilieges/1
  # PATCH/PUT /privilieges/1.json
  def update
    respond_to do |format|
      if @priviliege.update(priviliege_params)
        format.html { redirect_to @priviliege, notice: 'Priviliege was successfully updated.' }
        format.json { render :show, status: :ok, location: @priviliege }
      else
        format.html { render :edit }
        format.json { render json: @priviliege.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /privilieges/1
  # DELETE /privilieges/1.json
  def destroy
    @priviliege.destroy
    respond_to do |format|
      format.html { redirect_to privilieges_url, notice: 'Priviliege was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def generate_key
    authorize!
    file_path = params[:priviliege].include?("[") ? generate_privilieges_keys : params[:priviliege].include?("SHOP_CREDITS") ? generate_credits_keys : generate_personal_items_keys
    send_file(file_path) and return
    # send_data file_path, filename: file_path, disposition: 'inline', type: "multipart/related"
  end

  def generate_personal_items_keys
    lt = params[:lifetime].to_s.downcase == "true" ? "lifetime" : "month"
    file_name = "tmp/#{params[:priviliege]}_#{lt}_#{DateTime.now.strftime("%d_%m_%G-%s")}.txt"
    10.times do
      base = Faker::String.random(length: 4..6)
      postfix = Digest::SHA2.hexdigest base
      result = "#{params[:priviliege]}-#{postfix}"
      File.write(file_name, "#{result}\n", mode: 'a')
      PersonalItem.create!(key: result, lifetime: 1)
    end
    file_name
  end

  def generate_privilieges_keys
    lt = params[:lifetime].to_s.downcase == "true" ? "lifetime" : "month"
    duration = params[:lifetime].to_s.downcase == "true" ? 0 : 2592000
    file_name = "tmp/#{params[:priviliege]}_#{lt}_#{DateTime.now.strftime("%d_%m_%G-%s")}.txt"
    File.write(file_name, "", mode: 'a');
    15.times do
      base = Faker::String.random(length: 4..6)
      key = Digest::SHA256.bubblebabble(base).slice(0, 28)
      File.write(file_name, "#{key}\n", mode: 'a')
      PrevilegiesKey.create!(
        key_name: key, 
        type: "vip_add", 
        expires: 0, 
        uses: 1, 
        sid: 0, 
        param1: params[:priviliege], 
        param2: duration
      )
    end
    file_name
  end

  def generate_credits_keys
    lt = params[:lifetime].to_s.downcase == "true" ? "50000" : "25000"
    file_name = "tmp/#{params[:priviliege]}_#{lt}_#{DateTime.now.strftime("%d_%m_%G-%s")}.txt"
    File.write(file_name, "", mode: 'a');
    15.times do
      key = Devise.friendly_token.slice(0, 20).gsub(/[_&*]/, '-')
      File.write(file_name, "#{key}\n", mode: 'a')
      PrevilegiesKey.create!(
         key_name: key,
         type: "shop_credits",
         expires: 0,
         uses: 1,
         sid: 0,
         param1: lt
      )
    end
    file_name
  end

  def authorize!
    user = User.find_by(steamID: params[:steamID])
    return render json: {error: 'Unauthorized'}, status: 401  unless user.superadmin? && user.auth_token_valid?(params[:auth_token]) && user.present?
 end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_priviliege
      @priviliege = Priviliege.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def priviliege_params
      params.fetch(:priviliege, {})
    end
end
