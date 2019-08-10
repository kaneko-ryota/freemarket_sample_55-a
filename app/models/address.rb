class Address < ApplicationRecord
  belongs_to :user

  validates_uniquness_of :user_id
  validates :postal_code, presence: true, format: {with: /\A[0-9]\z/}
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :house_number, presence: true
end
