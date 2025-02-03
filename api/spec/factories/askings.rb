FactoryBot.define do
  factory :asking do
    client_id { create(:client).id }
    history { { 'history_key' => 'history_value' } }
    sent_at { Time.now }
  end
end