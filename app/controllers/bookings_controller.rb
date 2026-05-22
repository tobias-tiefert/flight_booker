class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new(flight: @flight)

    @passenger_count = (params[:passenger_count] || 1).to_i
    @passenger_count.times do
      @booking.passengers.build
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
    @passenger_count = @booking.passengers.count
  end

  def create
    @booking = Booking.new(allowed_booking_params)

    if @booking.save
      redirect_to @booking
    else
      flash.now[:alert] = "Booking couldn't be saved."
      render :new, status: :unprocessable_content
    end
  end

  private

  def allowed_booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [ :id, :name, :email ])
  end
end
