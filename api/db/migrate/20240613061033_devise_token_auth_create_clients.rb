class DeviseTokenAuthCreateClients < ActiveRecord::Migration[6.1]
  def change
    
    create_table(:clients) do |t|
      ## Required
      t.string :provider, :null => false, :default => "email"
      t.string :uid, :null => false, :default => ""

      ## Database authenticatable
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.boolean  :allow_password_change, :default => false

      ## Rememberable
      t.datetime :remember_created_at

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## User Info 編集しました
      # t.string :name
      # t.string :nickname
      # t.string :image
      # t.string :email
      t.string :avatar # "アバターパス"
      t.string :name # "名前"
      t.boolean :is_corporation, default: true # "法人フラグ"
      t.string :email # UK "メールアドレス"
      # t.string :encrypted_password # "パスワード"
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

      ## Tokens
      t.json :tokens

      t.timestamps
    end

    add_index :clients, :email,                unique: true
    add_index :clients, [:uid, :provider],     unique: true
    add_index :clients, :reset_password_token, unique: true
    add_index :clients, :confirmation_token,   unique: true
    # add_index :clients, :unlock_token,         unique: true
    add_index :clients, :tel, unique: true
    add_index :clients, :client_name, unique: true

  end
end
