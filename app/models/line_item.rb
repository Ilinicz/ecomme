class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :cart

  #Count total price of LineItem
  def total_price
    product.price * quantity
  end

  #Decrease line_item quantity by 1, when 0 - destroy
  def decrease(id)
    current_item = LineItem.find_by_id(id)
    current_item.quantity > 1 ? current_item.quantity -= 1 : current_item.destroy
    current_item
  end

  #Increase line_item quantity by 1.
  def increase(id)
    current_item = LineItem.find_by_id(id)
    current_item.quantity += 1
    current_item
  end
end
