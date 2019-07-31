class RemoveColumnFromCredits < ActiveRecord::Migration[5.0]
  def change
    remove_column :credits, :card_number
    remove_column :credits, :expiration_date
    remove_column :credits, :security_code
  end
end