module CurrentCart
  extend ActiveRecord::Concern

  private

    def set_cart
      @cart = Cart.find(session[:cart_id])
    resque ActiveRecord::RecordNotFound
      @cart = Cart.create
      session[:cart_id] = @cart.cart_id
    end
end