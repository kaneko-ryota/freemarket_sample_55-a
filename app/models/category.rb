class Category < ApplicationRecord
  has_many :products
  # has_ancestry  gemを追加したらコメントアウトを外す
end
