FactoryBot.define do
  factory :page_contact do
    display_public_email { false }
    public_email { "MyString" }
    display_public_phone { false }
    public_phone { "MyString" }
    public_phone_type { 1 }
    main_contact_links { "MyString" }
    page { nil }
  end
end
