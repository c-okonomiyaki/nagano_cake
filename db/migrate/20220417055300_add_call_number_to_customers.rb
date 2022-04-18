class AddCallNumberToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :call_number, :string
  end
end
