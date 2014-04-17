module StoreHelper
  
  def current_user_name
    current_user ? "You are #{current_user.name}." : "U'r not logged in."  
  end

  def current_user_cart
    session[:cart_id] ? "Your cart's number: #{session[:cart_id]}." : "You haven't got cart."
  end
end
