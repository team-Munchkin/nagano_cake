class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :cart_items, dependent: :destroy

  validates :family_name,length: { in: 1..10 }
  validates :first_name,length: { in: 1..10 }
  validates :family_name_kana,length: { in: 1..10 }
  validates :first_name_kana,length: { in: 1..10 }
  validates :post_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true

  def active_for_authentication?
    super && (is_deleted == false)
  end
end
