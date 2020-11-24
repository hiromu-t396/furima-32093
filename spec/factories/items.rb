FactoryBot.define do
  factory :item do
    name                  { Faker::Lorem.characters(number: 10) }
    explanation           { Faker::Lorem.characters(number: 10) }
    category_id           { 2 }
    condition_id          { 2 }
    delivery_id           { 2 }
    prefecture_id         { 2 }
    delivery_day_id       { 2 }
    price                 { 1000 }
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
