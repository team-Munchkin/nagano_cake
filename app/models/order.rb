class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :customer
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: {pay_waiting: 0, pay_confirming: 1, pay_making: 2, pay_preparation: 3, pay_sended: 4}

  def add_tax_price
    (self.price * 1.1).round
  end

  def post_address_display
    '〒' + post_code + '' + address + post_name
  end

  validates :payment_method, presence: true
  validates :status, presence: true
  validates :postage, presence: true
  validates :total_price, presence: true
  validates :post_code, presence: true
  validates :address, presence: true
  validates :post_name, presence: true

end
