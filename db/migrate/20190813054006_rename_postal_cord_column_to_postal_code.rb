class RenamePostalCordColumnToPostalCode < ActiveRecord::Migration[5.0]
  def change
    rename_column :personal_informations, :postal_cord, :postal_code
  end
end
