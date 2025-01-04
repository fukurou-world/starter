FactoryBot.define do
  factory :dealer_area do
    association :dealer
    association :area
  end
end