class CreatePersonalInformations < ActiveRecord::Migration[5.0]
  def change
    create_table :personal_informations do |t|
      t.references :user,         null: false, foreign_key: true
      t.string :name_last,        null: false
      t.string :name_first,       null: false
      t.string :name_kana_last,   null: false
      t.string :name_kana_first,  null: false
      t.integer :birthday,        null: false
      t.string :postal_cord,      null: false
      t.integer :prefecture_id,   null: false
      t.string :city,             null: false
      t.string :house_number ,    null: false
      t.string :building_name


      t.timestamps
    end
  end
end
