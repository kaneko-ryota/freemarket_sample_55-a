class CreateCredits < ActiveRecord::Migration[5.0]
  def change
    create_table :credits do |t|
      t.integer :user_id,         null: false
      t.integer :card_number,     null: false
      t.integer :expiration_date, null: false
      t.integer :security_code,   null: false

      t.timestamps
    end
  end
end
