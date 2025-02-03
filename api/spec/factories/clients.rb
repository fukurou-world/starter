FactoryBot.define do
  factory :client do
    sequence(:image) { |n| "/img/sample#{n}" }
    sequence(:avatar) { |n| "/img/sample#{n}" }
    sequence(:name) { |n| "クライアントC#{n}" }
    is_corporation { true}
    sequence(:email) { |n| "mail#{n}@dummy.co.xx" }
    encrypted_password { "password" }
    sequence(:tel) { |n| "0302200440#{n}" }
    sequence(:client_name) { |n| "C-TRO#{n}" }
    sequence(:url_x) { |n| "ctaroxx1111#{n}" }
    area_id { create(:area).id }
    is_secret_address { false }
    sequence(:address) { |n| "東京都港区六本木#{n}" }
    pay_min { 1000 }
    pay_max { 2000 }
    is_uniform { true }
    notices { "クライアント特記事項" }
    deleted_at { nil }
  end
end