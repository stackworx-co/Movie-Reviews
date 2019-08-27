class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :movie

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all.order("created_at DESC")
    @movies = scope
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @reviews = Review.where(movie_id: @movie.id).order("created_at DESC")

    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
  end

  def top_rated_movies
    #all top rated movies
    @movies = Movie.where('avg_rating > ?', 3)
    # authorize! :read, @movie
  end
  def edit
  end

  def new
    @movie = current_user.movies.build
  end
  def create
    @movie = current_user.movies.build(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :description, :movie_length, :director, :rating, :actros, :user_id, :genre, :avatar, :price)
    end

  def scope
    ::Movie.all.includes(:bookings)
  end
end
