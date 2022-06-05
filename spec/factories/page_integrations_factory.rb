FactoryBot.define do
  factory :page_integration do
    facebook_pixel { "MyString" }
    google_analytics { "MyString" }
    email_capture { false }
    page { nil }
  end
end
