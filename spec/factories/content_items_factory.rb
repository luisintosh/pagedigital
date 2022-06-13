FactoryBot.define do
  factory :content_item do
    url { "MyString" }
    title { "MyString" }
    subtitle { "MyString" }
    embedded { false }
    highlight { false }
    custom_thumbnail { false }
    schedule { false }
    schedule_date { "2022-06-11 20:35:23" }
    position { 1 }
    page { nil }
  end
end
