class AddDeletedAtToClients < ActiveRecord::Migration[8.0]
  def change
    add_column :clients, :deleted_at, :datetime, null: true
  end
end
