class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :claim
      t.integer :postage
      t.integer :payment_method
      t.string :postcode
      t.string :address
      t.string :name
      t.integer :order_status

      t.timestamps
    end
  end
end
