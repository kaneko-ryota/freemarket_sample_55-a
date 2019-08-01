class RenamePurchaseIdColumnToBuyerId < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :purchase_id, :buyer_id
  end
end
