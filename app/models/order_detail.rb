class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  with_options presence: true do
    validates :quantity
    validates :tax_price
    validates :production_status
  end

  enum production_status: {着手不可:0,製作待ち:1,製作中:2,製作完了:3}
end