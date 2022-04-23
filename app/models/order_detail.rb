class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  validates :quantity, :tax_price, :production_status, presence:true
  
end
