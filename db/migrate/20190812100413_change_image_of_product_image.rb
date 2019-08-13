class ChangeImageOfProductImage < ActiveRecord::Migration[5.0]
  def self.up
    change_column_null :product_images, :image, false, 0
  end
end
