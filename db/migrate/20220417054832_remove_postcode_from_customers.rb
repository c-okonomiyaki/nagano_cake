class RemovePostcodeFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :postcode, :integer
  end
end
