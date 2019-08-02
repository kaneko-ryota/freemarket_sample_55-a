class AddNullToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :name_kana, :string
    change_column :users, :nickname, :string
    change_column :users, :birthday, :integer, null: true
    change_column :users, :phone_number, :string, unique: true
    change_column :users, :profile, :text
  end
end