class Item < ApplicationRecord

  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_day_id, presence: true
  validates :price, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :delivery_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :delivery_day_id, numericality: { other_than: 1 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_day

  has_one_attached :image
  belongs_to :user
  has_one :transaction
end