class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :item_name
      t.integer :price
      t.text :introduction
      t.boolean :is_active

      t.timestamps
    end
  end
end
