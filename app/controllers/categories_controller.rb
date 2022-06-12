class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

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

  def category_params
    params.require(:category).permit(:name)
  end
end