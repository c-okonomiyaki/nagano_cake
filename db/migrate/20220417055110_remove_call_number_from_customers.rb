class RemoveCallNumberFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :call_number, :integer
  end
end
