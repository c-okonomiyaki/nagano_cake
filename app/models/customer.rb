class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :first_name_kana, :last_name, :last_name_kana, :postcode, :address, :call_number, :email, :is_deleted, presence:true

  has_many :carts
  has_many :orders
  has_many :deliveries

  def full_name
    self.last_name + " " + self.first_name
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end

end
