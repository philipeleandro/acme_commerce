class OrderProducts < ApplicationController
  def create
    order_product_params = params.require(:order_product).permit(:product_id, :client_id)
    @order_product = OrderProduct.create(order_product_params)
  end
end