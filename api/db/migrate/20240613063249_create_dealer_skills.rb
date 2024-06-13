class CreateDealerSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :dealer_skills do |t|
      t.references :dealer, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
