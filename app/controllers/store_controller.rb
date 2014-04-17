class StoreController < ApplicationController

  def index
    @products = Product.order(:title).paginate(page: params[:page])
  end

  #GET products/1
  def show
    @product = Product.find(params[:id])
  end
end
