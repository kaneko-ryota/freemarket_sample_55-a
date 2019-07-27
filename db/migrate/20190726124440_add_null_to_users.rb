class AddNullToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :name, :string, null: false
    change_column :users, :name_kana, :string, null: true
    change_column :users, :nickname, :string, null: true
    change_column :users, :birthday, :integer, null: true
    change_column :users, :phone_number, :string, null: true, unique: true
    change_column :users, :profile, :text
  end
end
