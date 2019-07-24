class Product < ApplicationRecord
  has_many :comments
  has_many :liked_users, through: :likes, source: :user
  has_many :images
  belongs_to :user
  belongs_to :brand
  belongs_to :category
end
