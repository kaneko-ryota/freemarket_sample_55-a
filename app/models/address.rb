class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  delegate :name, to: :prefecture
  belongs_to :user

  validates :name_last, presence: true
  validates :name_first, presence: true
  validates :name_kana_last, presence: true, format: { with: /\p{Katakana}/}
  validates :name_kana_first, presence: true, format: { with: /\p{Katakana}/}
  validates :user_id, uniqueness: true
  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :house_number, presence: true
end
