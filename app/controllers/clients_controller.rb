class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client, only: [:edit, :update, :destroy]

  def index
    @q = Client.ransack(params[:q])
    @clients = @q.result(distinct: true).order(:name).paginate(:page => params[:page], :per_page => 3)
    #@clients = Client.order(:name)
  end

  def new
    @client = Client.new
  end

  def edit
  end

  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html do
          flash[:success] = "Criado!"
          redirect_to clients_path
        end
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html do
          flash[:success] = "Atualizado!"
          redirect_to clients_path
        end
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Cliente excluido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:name, :student, :registro_aluno, :cpf, :email, :turma ,:document, :address, :ref)
    end
end
