class CreateEvaluationDealers < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluation_dealers do |t|
      t.references :dealer, foreign_key: true # FK "ディーラーID"
      t.references :client, foreign_key: true # FK "店舗ID"
      t.string :content # "レビュー内容"
      t.integer :rate # "レート"
      # t.datetime :rateAt # "評価投稿日時"

      t.timestamps
    end
  end
end
