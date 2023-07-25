class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum production_status:
    {
      impossible_manufacture:0,
      waiting_manufacture:1,
      manufacturing:2,
      finish:3
    }

  def order_subtotal
    self.tax_price*quantity
  end

  validates :tax_price, presence: true
  validates :quantity, presence: true
  validates :production_status, presence: true
end
