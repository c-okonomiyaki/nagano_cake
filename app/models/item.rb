class Item < ApplicationRecord
  has_one_attached:item_image

  belongs_to :genre
  has_many :carts ,dependent: :destroy
  has_many :order_details ,dependent: :destroy

  with_options presence: true do
    validates :item_name
    validates :price
    validates :introduction
  end

  def get_item_image
    unless item_image.attached?
      file_path=Rails.root.join("app/assets/images/image1.jpg")
      item_image.attach(io:File.open(file_path),filename:"default-image.jpg",content_type:"image/jpeg")
    end
      item_image
  end

  def with_tax_price
    (price * 1.1).floor
  end
end