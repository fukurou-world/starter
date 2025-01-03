class CreateDealers < ActiveRecord::Migration[6.1]
  def change
    
    create_table(:dealers) do |t|
      t.string :avatar # "アバターパス"
      t.string :name # "名前"
      t.string :gender # "性別"
      t.string :email  # "メールアドレス"
      t.string :encrypted_password # "パスワード"
      t.string :tel # "電話番号"
      t.string :dealer_name # "ディーラーネーム"
      t.string :url_x # "XのURLリンク"
      t.integer :years_of_experience # "経験年数"
      t.integer :fee_min # "最低報酬額"
      t.integer :fee_max # "最高報酬額"
      t.string :payment_account # "支払い口座"
      t.string :notices # "特記事項"

      t.timestamps
    end

    add_index :dealers, :email, unique: true
    add_index :dealers, :tel,   unique: true
    add_index :dealers, :dealer_name,   unique: true

  end
end
