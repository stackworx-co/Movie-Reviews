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
      # format.html
      # format.pdf do
      #   @pdf = render_to_string :pdf => @movie.title,
      #                           :encoding => "UTF-8",
      #                           template: "bookings/show.html.erb"
      #   send_data(@pdf, :filename => "#{@movie.title}.pdf",  :type=>"application/pdf", :layout => "pdf")
      # end
      format.pdf do
            render pdf: @movie.title,
                   template: "bookings/show.html.erb",
                   page_size: 'A4',
                   encoding:"UTF-8",
                   layout: "pdf"
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
    params.require(:booking).permit(:qty)
  end
end
