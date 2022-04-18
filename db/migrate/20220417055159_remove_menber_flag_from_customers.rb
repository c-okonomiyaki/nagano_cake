class RemoveMenberFlagFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :member_flag, :integer
  end
end
