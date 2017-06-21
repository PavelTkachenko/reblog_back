class AddYearAndOriginToMovie < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :year, :integer
    add_column :movies, :origin, :string
  end
end
