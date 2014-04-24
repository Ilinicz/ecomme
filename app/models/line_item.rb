class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :cart

  #Count total price of LineItem
  def total_price
    product.price * quantity
  end

  #Decrease line_item quantity by 1, when 0 - destroy
  def decrease!
    self.quantity > 1 ? self.quantity -= 1 : self.destroy
    self
  end

  #Increase line_item quantity by 1.
  def increase!
    self.quantity += 1
    self
  end
end
