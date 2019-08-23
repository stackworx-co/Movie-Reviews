class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :email,  presence: true

  has_many :reviews, dependent: :destroy
  has_many :movies
  has_many :bookings
  def full_name
    "#{first_name} #{last_name}"
  end
end
