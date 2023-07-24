class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy

  validates :family_name,length: { in: 1..10 }
  validates :first_name,length: { in: 1..10 }
  validates :family_name_kana,length: { in: 1..10 }
  validates :first_name_kana,length: { in: 1..10 }
  validates :post_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :is_deleted, inclusion: { in: [true, false] }

  def active_for_authentication?
    super && (is_deleted == false)
  end

  def current_address_display
    '〒' + post_code + '' + address + family_name + first_name
  end
end


