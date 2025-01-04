json.id @dealer.id
json.avatar @dealer.avatar
json.name @dealer.name
json.gender @dealer.gender
json.email @dealer.email
json.encrypted_password @dealer.encrypted_password
json.tel @dealer.tel
json.dealer_name @dealer.dealer_name
json.url_x @dealer.url_x
json.date_of_becoming @dealer.date_of_becoming
json.fee_min @dealer.fee_min
json.fee_max @dealer.fee_max
json.payment_account @dealer.payment_account
json.notices @dealer.notices
json.deleted_at @dealer.deleted_at

json.areas @dealer.areas do |area|
  json.id area.id
  json.name area.name
end