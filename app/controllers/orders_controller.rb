class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @orders = Order.all
  end
end