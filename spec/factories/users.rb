FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password =  Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) 
    password {password}
    password_confirmation {password}
    nickname {Faker::Name.name}
    birth_date {Faker::Date.between(from: '1930-1-1', to: '2021-8-27')}
    precious_word {Faker::Lorem.characters(number: 100)}
  end
end
 