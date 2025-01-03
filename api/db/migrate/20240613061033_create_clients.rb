class CreateClients < ActiveRecord::Migration[6.1]
  def change
    
    create_table(:clients) do |t|
      t.string :nickname
      t.string :image
      t.string :avatar # "アバターパス"
      t.string :name # "名前"
      t.boolean :is_corporation, default: true # "法人フラグ"
      t.string :email # UK "メールアドレス"
      t.string :encrypted_password # "パスワード"
      t.string :tel # UK "電話番号"
      t.string :client_name # UK "クライアントネーム"
      t.string :url_x # "XのURLリンク"
      t.references :area, foreign_key: true # FK "エリアID"
      t.boolean :is_secret_address, default: false # "住所非公開フラグ"
      t.string :address # "住所"
      t.integer :pay_min # "最低支払額"
      t.integer :pay_max # "最高支払額"
      t.boolean :is_uniform # "制服有無"
      t.string :notices # "特記事項"

      t.timestamps
    end

    add_index :clients, :email, unique: true
    add_index :clients, :tel, unique: true
    add_index :clients, :client_name, unique: true

  end
end
