FactoryBot.define do
  factory :client_schedule do
    client { nil }
    asking_date { "2025-01-03" }
    asking_time_start { "MyString" }
    asking_time_end { "MyString" }
    notices { "MyString" }
  end
end
