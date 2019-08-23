class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  # validates :price, :qty,  presence: true

end
