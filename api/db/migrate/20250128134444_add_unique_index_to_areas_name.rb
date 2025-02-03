class AddUniqueIndexToAreasName < ActiveRecord::Migration[8.0]
  def change
    add_index :areas, :name, unique: true
  end
end
