class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def order_subtotal
    self.tax_price*quantity
  end

  validates :tax_price, presence: true
  validates :quantity, presence: true
  validates :production_status, presence: true
end
