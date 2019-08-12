class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  delegate :name, to: :prefecture
  belongs_to :user

  # validates_uniquness_of :user_id
  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :house_number, presence: true
end
