class RenameYearsOfExperienceColumnToDealers < ActiveRecord::Migration[6.1]

  def up
    remove_column :dealers, :years_of_experience
    add_column :dealers, :date_of_becoming, :date, after: :url_x
  end

  def down
    remove_column :dealers, :date_of_becoming
    add_column :dealers, :years_of_experience, :integer
  end

end

