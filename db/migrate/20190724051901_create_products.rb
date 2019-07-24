class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :explain, null: false
      t.string :size
      t.string :item_status, null: false
      t.string :burden, null: false
      t.string :delivery_method, null: false
      t.string :region, null: false
      t.string :delivery_date, null: false
      t.integer :price, null: false
      t.integer :trade_status, null: false, default: 0
      t.integer :saler_id, null: false
      t.integer :purchase_id

      t.timestamps
    end
  end
end
