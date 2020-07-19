class PersonalFeaturesController < ApplicationController
  before_action :set_personal_feature, only: [:show, :edit, :update, :destroy]

  # GET /personal_features
  # GET /personal_features.json
  def index
    render json: PersonalFeature.all.sort_by(&:created_at).as_json
  end

  # GET /personal_features/1
  # GET /personal_features/1.json
  def show
  end

  # GET /personal_features/new
  def new
    @personal_feature = PersonalFeature.new
  end

  # GET /personal_features/1/edit
  def edit
  end

  # POST /personal_features
  # POST /personal_features.json
  def create
    @personal_feature = PersonalFeature.new(personal_feature_params)

    respond_to do |format|
      if @personal_feature.save
        format.html { redirect_to @personal_feature, notice: 'Personal feature was successfully created.' }
        format.json { render :show, status: :created, location: @personal_feature }
      else
        format.html { render :new }
        format.json { render json: @personal_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personal_features/1
  # PATCH/PUT /personal_features/1.json
  def update
    respond_to do |format|
      if @personal_feature.update(personal_feature_params)
        format.html { redirect_to @personal_feature, notice: 'Personal feature was successfully updated.' }
        format.json { render :show, status: :ok, location: @personal_feature }
      else
        format.html { render :edit }
        format.json { render json: @personal_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_features/1
  # DELETE /personal_features/1.json
  def destroy
    @personal_feature.destroy
    respond_to do |format|
      format.html { redirect_to personal_features_url, notice: 'Personal feature was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personal_feature
      @personal_feature = PersonalFeature.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def personal_feature_params
      params.fetch(:personal_feature, {})
    end
end
