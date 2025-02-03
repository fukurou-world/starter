class AddUniqueIndexToSkillsName < ActiveRecord::Migration[8.0]
  def change
    add_index :skills, :name, unique: true
  end
end
