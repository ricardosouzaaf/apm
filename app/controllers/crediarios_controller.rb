class CrediariosController < ApplicationController
  before_action :set_crediario, only: [:show, :edit, :update, :destroy]

  # GET /crediarios
  # GET /crediarios.json
  def index
    @crediarios = Crediario.all
  end

  # GET /crediarios/1
  # GET /crediarios/1.json
  def show
  end

  # GET /crediarios/new
  def new
    @crediario = Crediario.new
  end

  # GET /crediarios/1/edit
  def edit
  end

  # POST /crediarios
  # POST /crediarios.json
  def create
    @crediario = Crediario.new(crediario_params)

    respond_to do |format|
      if @crediario.save
        format.html { redirect_to @crediario, notice: 'Crediario was successfully created.' }
        format.json { render :show, status: :created, location: @crediario }
      else
        format.html { render :new }
        format.json { render json: @crediario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crediarios/1
  # PATCH/PUT /crediarios/1.json
  def update
    respond_to do |format|
      if @crediario.update(crediario_params)
        format.html { redirect_to @crediario, notice: 'Crediario was successfully updated.' }
        format.json { render :show, status: :ok, location: @crediario }
      else
        format.html { render :edit }
        format.json { render json: @crediario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crediarios/1
  # DELETE /crediarios/1.json
  def destroy
    @crediario.destroy
    respond_to do |format|
      format.html { redirect_to crediarios_url, notice: 'Crediario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crediario
      @crediario = Crediario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crediario_params
      params.require(:crediario).permit(:client_id, :amount, :emission, :maturity, :doc_number, :printed, :status)
    end
end
