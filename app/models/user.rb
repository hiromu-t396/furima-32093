class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :lastname, format: { with: /\A[ぁ-んァ-ン一-龥]\z/ }
  validates :firstname, format: { with: /\A[ぁ-んァ-ン一-龥]\z/ }
  validates :lastname_kana, format: { with: /\A[ァ-ン]\z/ }
  validates :firstname_kana, format: { with: /\A[ァ-ン]\z/ }

  has_many :items
  has_many :transactions

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
end
