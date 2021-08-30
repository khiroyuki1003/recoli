FactoryBot.define do
  factory :list do
    list_title {Faker::Lorem.words(number: 1)}
    list_detail {Faker::Lorem.sentences(number: 1)}
    priority_id {2}

    association :category
  end
end
 