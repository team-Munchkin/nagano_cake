class CartItem < ApplicationRecord

  belongs_to :item
  belongs_to :customer

  def subtotal
    item.taxin_price*quantity
  end

end
