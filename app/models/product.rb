class Product < ApplicationRecord
  has_many :comments
  has_many :liked_users, through: :likes, source: :user
  has_many :images
  belongs_to :user
  belongs_to :brand
  belongs_to :category

  scope :ladies, -> {where(category_id: 1).order("created_at DESC").limit(4)}
  scope :mens,  -> {where(category_id: 2).order("created_at DESC").limit(4)}
end