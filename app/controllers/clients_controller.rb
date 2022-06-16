# frozen_string_literal: true

# Client actions
class ClientsController < ApplicationController
  before_action :authenticate_user!, only: %i[index new show create edit update]

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

  def destroy
    @client = Client.find(params[:id])

    @client.destroy
    redirect_to clients_path, notice: 'Cliente deletado com sucesso'
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])

    if @client.update(client_params)
      redirect_to clients_path, notice: 'Cliente atualizado com sucesso'
    else
      flash.now[:notice] = 'Não foi possível atualizar'
      render 'edit'
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :address, :city, :state, :email)
  end
end
