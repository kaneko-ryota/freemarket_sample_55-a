class RenamePrefectureToPrefectureId < ActiveRecord::Migration[5.0]
  def change
    rename_column :addresses, :prefecture, :prefecture_id
  end
end
