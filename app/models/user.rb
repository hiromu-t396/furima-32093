class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A@\z/ }
  validates :encrypted_password, length: { minimum: 6 }, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :lastname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]\z/ }
  validates :firstname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]\z/ }
  validates :lastname_kana, presence: true, format: { with: /\A[ァ-ン]\z/ }
  validates :lastname_kana, presence: true, format: { with: /\A[ァ-ン]\z/ }
  validates :birth_day, presence: true
  has_many :items
  has_many :transactions
end
