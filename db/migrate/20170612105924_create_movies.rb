class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies, id: :uuid do |t|
      t.string :title

      t.timestamps
    end
    add_index :movies, :title
  end
end
