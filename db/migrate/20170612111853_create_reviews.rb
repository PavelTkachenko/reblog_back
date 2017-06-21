class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews, id: :uuid do |t|
      t.uuid :movie_id
      t.uuid :author_id
      t.string :title
      t.text :text

      t.timestamps
    end
    add_index :reviews, :movie_id
    add_index :reviews, :author_id
    add_index :reviews, :title
  end
end
