class AddNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :name_kana, :string, null: false
    add_column :users, :nickname, :string, null: false
    add_column :users, :birthday, :integer, null: false
    add_column :users, :phone_number, :string, null: false, unique: true
    add_column :users, :profile, :text
  end
end
