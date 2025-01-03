class AddDeletedAtToDealers < ActiveRecord::Migration[8.0]
  def change
    add_column :dealers, :deleted_at, :datetime, null: true
  end
end
