class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :movie_id, uniqueness: { scope: :user_id, message: "You've reviewed this movie!" }
  validates :rating, presence: :true

  def update_movie_avg_rating movie
    movie_reviews = movie.reviews
    avg_rating = movie_reviews.present? ? movie_reviews.average(:rating).round(2) : 0
    movie.update_attributes(avg_rating: avg_rating)
  end
end
