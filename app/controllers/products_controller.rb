# frozen_string_literal: true

# Product actions
class ProductsController < ApplicationController
  before_action :authenticate_user!, only: %i[index show new create edit update destroy product_report]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path, notice: 'Produto cadastrado'
    else
      flash.now[:notice] = 'Não foi possível cadastrar'
      render 'new'
    end
  end

  def destroy
    @product = Product.find(params[:id])

    @product.destroy
    redirect_to products_path, notice: 'Produto deletado'
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to products_path, notice: 'Produto atualizado'
    else
      flash.now[:notice] = 'Não foi possível atualizar'
      render 'edit'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def product_report
    @products = OrderProduct.all.map { |b| Product.find_by(id: b.product_id).name }
  end

  private

  def product_params
    params.require(:product).permit(:name, :value, :base_value, :image_url, :category_id)
  end
end
