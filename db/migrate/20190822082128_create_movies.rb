class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.string :movie_length
      t.string :director
      t.string :rating
      t.string :actros
      t.references :user, foreign_key: true
      t.string :genre

      t.timestamps
    end
  end
end
