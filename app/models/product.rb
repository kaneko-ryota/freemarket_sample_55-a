class Product < ApplicationRecord
  has_many :comments
  has_many :liked_users, through: :likes, source: :user
  has_many :images
  belongs_to :user
  belongs_to :brand
  belongs_to :category


  scope :ladies, -> {where(category_id: 1).order("created_at DESC").limit(4)}
  scope :mens,  -> {where(category_id: 1).order("created_at DESC").limit(4)}


  def previous
    if user.products.order('id desc').where('id < ?', id).first == nil
      user.products.last
    else
      user.products.order('id desc').where('id < ?', id).first
    end
  end

  def next
    if user.products.order('id desc').where('id > ?', id).reverse.first == nil
      user.products.first
    else
      user.products.order('id desc').where('id > ?', id).reverse.first
    end
  end

end
