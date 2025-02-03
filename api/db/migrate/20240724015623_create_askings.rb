class CreateAskings < ActiveRecord::Migration[6.1]
  def change
    create_table :askings do |t|
      t.references :client, null: false, foreign_key: true # "クライアントID"
      t.json :history # "履歴" 宛先dealer名、メッセージ内容、依頼日時、他
      t.datetime  :sent_at # "送信日時"
    end
  end
end
