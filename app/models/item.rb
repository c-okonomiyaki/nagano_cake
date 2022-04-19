class Item < ApplicationRecord
  has_one_attached:item_image

  belongs_to :genre
  has_many :carts ,dependet: :destroy
  has_many :order_details ,dependent: :destroy
end