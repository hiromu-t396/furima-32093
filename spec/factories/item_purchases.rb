FactoryBot.define do
  factory :item_purchase do
    postal_code                  { "111-1111" }
    prefecture_id           { 2 }
    municipality         { "横浜市緑区" }
    address          { "青山1-1-1" }
    building_name           { "柳ビル103" }
    phone_number         { "00000000000" }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
