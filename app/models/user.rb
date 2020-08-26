class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  FULL_WIDTH_REGEX = /\A[ぁ-んァ-ン一-龥]/
  KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :password, confirmation: true, length: { minimum: 6 }, format: {with: PASSWORD_REGEX, message: "Password confirmation doesn't match Password"}

  #validates :password, confirmation: true, length: { minimum: 6 }, format: { with: /\A[a-zA-Z0-9]+\z/, message: "is invalid. Input half-width characters."}

  with_options presence: true do
    validates :nickname
    validates :family_name, format: { with: FULL_WIDTH_REGEX, message: "is invalid. Input full-width characters."}
    validates :first_name, format: { with: FULL_WIDTH_REGEX, message: "is invalid. Input full-width characters."}
    validates :family_name_kana, format: { with: KATAKANA_REGEX, message: "is invalid. Input full-width katakana characters."}
    validates :first_name_kana, format: { with: KATAKANA_REGEX, message: "is invalid. Input full-width katakana characters."}
    validates :birth_day
  end
end
