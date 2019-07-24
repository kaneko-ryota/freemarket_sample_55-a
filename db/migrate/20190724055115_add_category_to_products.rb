class AddCategoryToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :category, index: true
    add_reference :products, :brand, index: true
  end
end
