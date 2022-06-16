# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!, only: %i[index new create show edit update]

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
      order_product.save

      redirect_to orders_path, notice: 'Ordem cadastrado'
    else
      flash.now[:notice] = 'Não foi possível cadastrar'
      render 'new'
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:id])

    @order.destroy
    redirect_to orders_path, notice: 'Ordem deletada com sucesso'
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])

    if @order.update(order_params)
      redirect_to orders_path, notice: 'Ordem atualizada com sucesso'
    else
      flash.now[:notice] = 'Não foi possível atualizar'
      render 'edit'
    end
  end

  private

  def order_params
    params.require(:order).permit(:reference_number, :status, :payment_date, :value, :client_id, :product_id)
  end
end
