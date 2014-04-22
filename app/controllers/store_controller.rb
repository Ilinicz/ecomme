class StoreController < ApplicationController
  include CurrentCart
  include SessionsCounter
  before_action :set_cart
  before_action :index_session_counter, only: [:index]

  def index
    @products = Product.order(:title).paginate(page: params[:page])
  end

  #GET products/1
  def show
    @product = Product.find(params[:id])
  end

end
