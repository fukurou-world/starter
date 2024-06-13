class CreateClientAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :client_areas do |t|
      t.references :client, null: false, foreign_key: true
      t.references :area, null: false, foreign_key: true

      t.timestamps
    end
  end
end
