class AddColumnUsers < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :name_first, :string
    add_column :users, :name_kana_first, :string
  end
end
