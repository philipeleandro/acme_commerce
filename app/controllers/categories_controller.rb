# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: %i[index new create edit update filter_product]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path, notice: 'Categoria cadastrada'
    else
      flash.now[:notice] = 'Não foi possível cadastrar'
      render 'new'
    end
  end

  def destroy
    @category = Category.find(params[:id])

    @category.destroy
    redirect_to categories_path, notice: 'Categoria deletada'
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to categories_path, notice: 'Categoria atualizada com sucesso'
    else
      flash.now[:notice] = 'Não foi possível atualizar'
      render 'edit'
    end
  end

  def filter_product
    @category = Category.find(params[:id])
    @products = Product.where(category_id: @category.id)
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
