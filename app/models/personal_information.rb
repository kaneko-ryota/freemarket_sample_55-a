class PersonalInformation < ApplicationRecord
  belongs_to :user

  validates :user_id, uniqueness: true
  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :house_number, presence: true
end