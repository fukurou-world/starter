# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Area.create(name: '北海道')
Area.create(name: '青森県')

Skill.create(name: 'NLH')
Skill.create(name: 'PLO')

10.times do |i|
  n = i + 1
  Dealer.create(
    avatar: "/img/sample-#{n}",
    name: "ディーラー太郎-#{n}",
    gender: "male-#{n}",
    email: "mail@dummy.co.xx-#{n}",
    encrypted_password: "password-#{n}",
    tel: "01022004400-#{n}",
    dealer_name: "D-TRO-#{n}",
    url_x: "dtaroxx1111-#{n}",
    date_of_becoming: "2022-10-02-#{n}",
    fee_min: 1400,
    fee_max: 3000,
    payment_account: "UFJ-#{n}",
    notices: "特記事項-#{n}",
    deleted_at: nil
    )

  Client.create(
    image: "/img/sample-i-#{n}",
    avatar: "/img/sample-c-#{n}",
    name: "名前-#{n}",
    is_corporation: true,
    email: "mail-c@dummy.co.xx-#{n}",
    encrypted_password: "password-#{n}",
    tel: "03055007700#{n}",
    client_name: "クライアント名-#{n}",
    url_x: "cl-x-#{n}",
    area_id: 1,
    is_secret_address: false,
    address: "#{n}",
    pay_min: 1100,
    pay_max: 5000,
    is_uniform: true,
    notices: "クライアント特記事項#{n}",
  )
  end
