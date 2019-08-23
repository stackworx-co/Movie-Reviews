class BookingsController < ApplicationController
  # before_action :set_booking, only: [:show, :new, :create]
  before_action :set_movie
  before_action :authenticate_user!

  def index
    @bookings = Booking.all
  end
  def new
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Invoice No. #{@booking.id}",
               page_size: 'A4',
               template: "bookings/show.html.erb",
               layout: "pdf.html",
               orientation: "Landscape",
               lowquality: true,
               zoom: 1,
               dpi: 75
      end
    end
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.movie_id = @movie.id

    if @booking.save
      render 'show'
    else
      render 'new'
    end
  end

  private
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:name, :price, :qty)
  end
end
