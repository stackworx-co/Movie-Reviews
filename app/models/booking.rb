class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :qty,  presence: true
  validates :qty, :numericality => { :greater_than_or_equal_to => 1 }
end
