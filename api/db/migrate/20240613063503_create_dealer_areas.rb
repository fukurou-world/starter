class CreateDealerAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :dealer_areas do |t|
      t.references :dealer, null: false, foreign_key: true
      t.references :area, null: false, foreign_key: true

      t.timestamps
    end
  end
end
