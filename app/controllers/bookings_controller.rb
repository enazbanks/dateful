class BookingsController < ApplicationController

  def index
    @bookings = bookings.all
  end

  def new
    @experience = Experience.find(params[:experience_id])
    @booking = Booking.new
    # render 'bookings/new.html.erb'
  end

  def create
    @booking = Booking.new(booking_params)
    @experience = Experience.find(params[:experience_id])
    @booking.experience = @experience
    @booking.user = current_user
    # @booking.save # => true/false
    if @booking.save
      redirect_to experience_path(@experience)
      flash[:notice] = 'Successfully Booked'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:when, :instructions, :suprise, :status)
  end
end
