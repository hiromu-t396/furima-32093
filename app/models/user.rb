class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "Include both letters and numbers"}

  with_options presence: true do
    validates :nickname
    validates :email
    validates :password
    validates :lastname
    validates :firstname
    validates :lastname_kana
    validates :firstname_kana
    validates :birth_day
  end

  with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "Full-width characters"} do
    validates :lastname
    validates :firstname
  end

  with_options format: { with: /\A[ァ-ン]+\z/, message: "Full-width katakana characters" } do
    validates :lastname_kana
    validates :firstname_kana
  end

  has_many :items
  has_one :purchase, dependent: :destroy
  has_one :address, dependent: :destroy
end
