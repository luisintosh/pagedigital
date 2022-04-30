FactoryBot.define do
  factory :page do
    slug { 'UserName_123' }
    published { false }
    lock_code { '' }
  end
end
