FactoryBot.define do
  factory :blog do
    title { Faker::Lorem.word }
    content { Faker::Lorem.paragraph }
  end
end
