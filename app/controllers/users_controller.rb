class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #all top rated movies
    @movies = Movie.where('avg_rating > ?', 3)
  end
end
