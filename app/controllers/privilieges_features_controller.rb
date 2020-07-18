class PriviliegesFeaturesController < ApplicationController
  before_action :set_privilieges_feature, only: [:show, :edit, :update, :destroy]

  # GET /privilieges_features
  # GET /privilieges_features.json
  def index
    @privilieges_features = PriviliegesFeature.all
  end

  # GET /privilieges_features/1
  # GET /privilieges_features/1.json
  def show
  end

  # GET /privilieges_features/new
  def new
    @privilieges_feature = PriviliegesFeature.new
  end

  # GET /privilieges_features/1/edit
  def edit
  end

  # POST /privilieges_features
  # POST /privilieges_features.json
  def create
    @privilieges_feature = PriviliegesFeature.new(privilieges_feature_params)

    respond_to do |format|
      if @privilieges_feature.save
        format.html { redirect_to @privilieges_feature, notice: 'Privilieges feature was successfully created.' }
        format.json { render :show, status: :created, location: @privilieges_feature }
      else
        format.html { render :new }
        format.json { render json: @privilieges_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /privilieges_features/1
  # PATCH/PUT /privilieges_features/1.json
  def update
    respond_to do |format|
      if @privilieges_feature.update(privilieges_feature_params)
        format.html { redirect_to @privilieges_feature, notice: 'Privilieges feature was successfully updated.' }
        format.json { render :show, status: :ok, location: @privilieges_feature }
      else
        format.html { render :edit }
        format.json { render json: @privilieges_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /privilieges_features/1
  # DELETE /privilieges_features/1.json
  def destroy
    @privilieges_feature.destroy
    respond_to do |format|
      format.html { redirect_to privilieges_features_url, notice: 'Privilieges feature was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_privilieges_feature
      @privilieges_feature = PriviliegesFeature.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def privilieges_feature_params
      params.fetch(:privilieges_feature, {})
    end
end
