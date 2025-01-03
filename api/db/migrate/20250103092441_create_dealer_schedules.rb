class CreateDealerSchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :dealer_schedules do |t|
      t.references :dealer, null: false, foreign_key: true, comment: "ディーラーID"
      t.date :vacant_date, comment: "空き日付"
      t.string :vacant_time_start, comment: "空き開始時刻"
      t.string :vacant_time_end, comment: "空き終了時刻"
      t.string :notices, comment: "特記事項"

      t.timestamps
    end
  end
end