class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2, :facebook]

  has_many :products
  has_many :comments
  has_many :liked_products, through: :likes, source: :product
  has_many :orders
  has_one :credit
  has_one :address

  validates :name_last, presence: true
  validates :name_first, presence: true
  validates :name_kana_last, presence: true, format: { with: /\p{Katakana}/}
  validates :name_kana_first, presence: true, format: { with: /\p{Katakana}/}
  validates :email, presence: true, unless: :uid?
  validates :password, presence: true, format: { with: /\A[a-zA-Z\d]+\z/}, unless: :uid?
  validates :password_confirmation, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]/i}, unless: :uid?
  validates :nickname, presence: true, unless: :uid?
  validates :birthday, presence: true

  protected
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
