class Cart < ApplicationRecord
<<<<<<< HEAD
  belongs_to :customer
  belongs_to :item

  validates :quantity, presence:true

  def subtotal
    item.with_tax_price * quantity
  end
=======
>>>>>>> main
end
