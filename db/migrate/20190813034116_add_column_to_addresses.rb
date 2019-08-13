class AddColumnToAddresses < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :name_last,        :string,        null: false
    add_column :addresses, :name_first,       :string,        null: false
    add_column :addresses, :name_kana_last,   :string,        null: false
    add_column :addresses, :name_kana_first,  :string,        null: false
    add_column :addresses, :phone_number,     :string
  end
end