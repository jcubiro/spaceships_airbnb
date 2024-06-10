class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: %i[edit update destroy]
  before_action :set_ship, only: %i[new create]

  def new
    @booking = @ship.bookings.build
  end

  def create
    @booking = @ship.bookings.build(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to my_bookings_path, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @booking.update(booking_params)
      redirect_to @booking.ship, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to @booking.ship, notice: 'Booking was successfully deleted.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_ship
    @ship = Ship.find(params[:ship_id])
  end

  def booking_params
    params.require(:booking).permit(%i[start_date end_date ship_id])
  end
end
