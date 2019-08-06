class RenameNameColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :name, :name_last
    rename_column :users, :name_kana, :name_kana_last
  end
end
