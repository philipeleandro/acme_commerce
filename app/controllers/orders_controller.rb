class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      order_product = OrderProduct.new(order_id: @order.id, product_id: params['order']['product_id'].to_i)
      order_product.order_id = @order.id
      order_product.save

      redirect_to orders_path, notice: 'Ordem cadastrado'
    else
      flash.now[:notice] = 'Não foi possível cadastrar'
      render 'new'
    end
  end

  def order_params
    params.require(:order).permit(:reference_number, :status, :payment_date, :value, :client_id, :product_id)
  end
end