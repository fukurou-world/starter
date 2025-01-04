FactoryBot.define do
  factory :dealer do
    sequence(:id) { |n| n }
    sequence(:avatar) { |n| "/img/sample#{n}" }
    sequence(:name) { |n| "ディーラー太郎#{n}" }
    gender { "male" }
    sequence(:email) { |n| "mail#{n}@dummy.co.xx" }
    encrypted_password { "password" }
    sequence(:tel) { |n| "0102200440#{n}" }
    sequence(:dealer_name) { |n| "D-TRO#{n}" }
    sequence(:url_x) { |n| "dtaroxx1111#{n}" }
    date_of_becoming { "2022-10-02" }
    fee_min { 1400 }
    fee_max { 3000 }
    payment_account { "UFJ" }
    notices { "特記事項" }
    deleted_at { "2025-02-03" }

    after(:create) do |dealer|
      create_list(:dealer_area, 1, dealer: dealer)
    end
  end
end