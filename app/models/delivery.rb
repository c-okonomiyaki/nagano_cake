class Delivery < ApplicationRecord
  belongs_to :customer,optional: true
  validates :address, :postcode, :address_name, presence:true

  def address_display
  '〒' + postcode + ' ' + address + ' ' + address_name
  end
end
