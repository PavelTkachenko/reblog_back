class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors, id: :uuid do |t|
      t.string :title

      t.timestamps
    end
    add_index :authors, :title
  end
end
