class Delivery < ApplicationRecord
  belongs_to :customer,optional: true

  def address_display
  '〒' + postcode + ' ' + address + ' ' + address_name
  end
end
