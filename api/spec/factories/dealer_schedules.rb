FactoryBot.define do
  factory :dealer_schedule do
    dealer { nil }
    vacant_date { "2025-01-03" }
    vacant_time_start { "18:30" }
    vacant_time_end { "23:00" }
    notices { "d_s_特記事項" }
  end
end
