class CreateRecruits < ActiveRecord::Migration[6.1]
  def change
    create_table :recruits do |t|
      t.string :title, null: false # "募集タイトル"
      t.datetime :deadline # "募集期限"
      t.datetime :startAt # "開始日時"
      t.datetime :endAt # "終了日時"
      t.references :client, foreign_key: true # FK "クライアントID"
      t.references :area, foreign_key: true # FK "エリアID"
      t.integer :fee_min # "最低報酬"
      t.integer :fee_max # "最高報酬"
      t.boolean :is_night_fee, default: false # "深夜手当有無"
      t.boolean :is_transportation_fee, default: false # "交通費有無フラグ"
      t.boolean :is_uniform # "制服有無フラグ"
      t.string :notices_uniform # "制服特記"
      t.string :job_description # "仕事内容"
      t.string :notices # "特記事項"

      t.timestamps
    end
  end
end
