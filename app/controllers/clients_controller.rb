class ClientsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :show, :create]

  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    
    if @client.save
      redirect_to clients_path, notice: 'Cliente cadastrado'
    else
      flash.now[:notice] = 'Não foi possível cadastrar'
      render 'new'
    end
  end

  def show
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :address, :city, :state)
  end
end