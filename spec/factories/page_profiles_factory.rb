FactoryBot.define do
  factory :page_profile do
    display_name { Faker::Lorem.paragraph_by_chars(number: 60) }
    location { Faker::Nation.nationality }
    description { Faker::Lorem.paragraph_by_chars(number: 256) }
    page { nil }
  end
end
