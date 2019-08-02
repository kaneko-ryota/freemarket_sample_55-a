class RenameTokenColumnToCardid < ActiveRecord::Migration[5.0]
  def change
    rename_column :credits, :card_token, :card_id
  end
end
