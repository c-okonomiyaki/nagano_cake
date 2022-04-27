class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< HEAD

   with_options presence: true do
    validates :first_name
    validates :first_name_kana
    validates :last_name
    validates :last_name_kana
    validates :postcode
    validates :address
    validates :call_number
    validates :email
  end

  has_many :carts
  has_many :orders
  has_many :deliveries
  has_many :items,through: :carts

  def full_name
    self.last_name + " " + self.first_name
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end

=======
>>>>>>> main
end
