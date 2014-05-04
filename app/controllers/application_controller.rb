class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #include ::CurrentCart
  #before_action :set_cart
  protect_from_forgery with: :exception

  def authenticate_admin_user!
      authenticate_user!
      unless current_user.admin?
        flash[:alert] = "Only administrator has access to this area."
        redirect_to root_url
      end
    end

    def current_admin_user
      return nil if user_signed_in? && !current_user.admin?
      current_user
    end

  private

    def current_cart
        Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
        redirect_to root_url, notice: "Something went wrong, try again, please"
    end

end
