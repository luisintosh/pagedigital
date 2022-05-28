FactoryBot.define do
  factory :page_profile do
    display_name { Faker::Lorem.paragraph_by_chars(number: 60) }
    location { Faker::Nation.nationality }
    description { Faker::Lorem.paragraph_by_chars(number: 256) }
    profile_image { Faker::Placeholdit.image(size: '500x500') }
    header_image { Faker::Placeholdit.image(size: '1920x460') }
    page { nil }
  end
end
