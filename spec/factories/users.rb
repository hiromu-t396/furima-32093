FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    lastname              {"木村"}
    firstname             {"拓也"}
    lastname_kana         {"キムラ"}
    firstname_kana        {"タクヤ"}
    birth_day             {Faker::Date.birthday(min_age: 5, max_age: 90)}
  end
end
