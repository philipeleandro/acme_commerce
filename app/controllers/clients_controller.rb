class ClientsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @clients = Client.all
  end
end