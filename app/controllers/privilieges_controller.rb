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
