class Address < ApplicationRecord
  with_optinos presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ },
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{,11}\z/ }
  end
  belongs_to :transaction
end

