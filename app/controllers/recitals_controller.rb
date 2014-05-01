class RecitalsController < ApplicationController
  before_action :set_recital, only: [:show, :edit, :update, :destroy]

  # GET /recitals
  # GET /recitals.json
  def index
    @recitals = Recital.all
  end

  # GET /recitals/1
  # GET /recitals/1.json
  def show
  end

  # GET /recitals/new
  def new
    @recital = Recital.new
  end

  # GET /recitals/1/edit
  def edit
  end

  # POST /recitals
  # POST /recitals.json
  def create
    @recital = Recital.new(recital_params)

    respond_to do |format|
      if @recital.save
        format.html { redirect_to @recital, notice: 'Recital was successfully created.' }
        format.json { render action: 'show', status: :created, location: @recital }
      else
        format.html { render action: 'new' }
        format.json { render json: @recital.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recitals/1
  # PATCH/PUT /recitals/1.json
  def update
    respond_to do |format|
      if @recital.update(recital_params)
        format.html { redirect_to @recital, notice: 'Recital was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @recital.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recitals/1
  # DELETE /recitals/1.json
  def destroy
    @recital.destroy
    respond_to do |format|
      format.html { redirect_to recitals_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recital
      @recital = Recital.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recital_params
      params.require(:recital).permit(:title, :content, :image_path)
    end
end
