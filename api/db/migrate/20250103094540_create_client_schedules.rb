class CreateClientSchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :client_schedules do |t|
      t.references :client, null: false, foreign_key: true, comment: "クライアントID"
      t.date :asking_date, comment: "依頼日付"
      t.string :asking_time_start, comment: "依頼開始時刻"
      t.string :asking_time_end, comment: "依頼終了時刻"
      t.string :notices, comment: "特記事項"

      t.timestamps
    end
  end
end