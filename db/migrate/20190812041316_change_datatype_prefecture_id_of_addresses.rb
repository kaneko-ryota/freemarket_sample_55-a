class ChangeDatatypePrefectureIdOfAddresses < ActiveRecord::Migration[5.0]
  def change
    change_column :addresses, :prefecture_id, :integer
  end
end
