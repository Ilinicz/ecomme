class StoreController < ApplicationController
  def index
    @products = Product.order(:title).paginate(page: params[:page])
  end
end
