class AddAvgRatingToMovie < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :avg_rating, :decimal
  end
end
