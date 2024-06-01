class BookingsController < ApplicationController
  before_action :set_ship, only: [:new, :create]
  before_action :authenticate_user! # Assuming you are using something like Devise for user authentication

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.ship = @ship

    if @booking.save
      redirect_to my_bookings_path, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  private

  def set_ship
    @ship = Ship.find(params[:ship_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
