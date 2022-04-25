class Delivery < ApplicationRecord
  belongs_to :customer,optional: true

  with_options presence: true do
    validates :address
    validates :postcode
    validates :address_name
  end

  def address_display
  '〒' + postcode + ' ' + address + ' ' + address_name
  end
end
