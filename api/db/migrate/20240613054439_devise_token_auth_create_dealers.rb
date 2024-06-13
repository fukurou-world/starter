class DeviseTokenAuthCreateDealers < ActiveRecord::Migration[6.1]
  def change
    
    create_table(:dealers) do |t|
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
      t.string :gender # "性別"
      t.string :email  # "メールアドレス"
      # t.string :encrypted_password # "パスワード"
      t.string :tel # "電話番号"
      t.string :dealer_name # "ディーラーネーム"
      t.string :url_x # "XのURLリンク"
      t.integer :years_of_experience # "経験年数"
      t.integer :fee_min # "最低報酬額"
      t.integer :fee_max # "最高報酬額"
      t.string :payment_account # "支払い口座"
      t.string :notices # "特記事項"

      ## Tokens
      t.json :tokens

      t.timestamps
    end

    add_index :dealers, :email,                unique: true
    add_index :dealers, [:uid, :provider],     unique: true
    add_index :dealers, :reset_password_token, unique: true
    add_index :dealers, :confirmation_token,   unique: true
    # add_index :dealers, :unlock_token,         unique: true
    # 追加しました
    add_index :dealers, :tel,   unique: true
    add_index :dealers, :dealer_name,   unique: true

  end
end
