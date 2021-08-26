class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(strong_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def strong_params
    params.require(:product)
          .permit(:name, :tagline)
  end
end
