class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :comments
  has_many :liked_products, through: :likes, source: :product
  has_one :credit
  has_one :address

  validates :name, presence: true
  validates :name_kana, presence: true
  validates :nickname, presence: true
  validates :birthday, presence: true
end
