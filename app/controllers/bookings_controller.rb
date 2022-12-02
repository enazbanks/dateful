class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking)
    @experiences = Experience.all
  end

  def new
    @experience = Experience.find(params[:experience_id])
    @booking = Booking.new
    authorize @booking
    # render 'bookings/new.html.erb'
  end

  def create
    @booking = Booking.new(booking_params)
    @experience = Experience.find(params[:experience_id])
    @booking.status = 'pending'
    @booking.experience = @experience
    @booking.couple = current_user.couple
    @booking.instructions = @experience.instructions
    authorize @booking
    # @booking.save # => true/false
    if @booking.save
      @booking.secret_list.add(current_user.id) if @booking.suprise?
      redirect_to experience_path(@experience)
      flash[:notice] = 'Successfully Booked'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:when, :instructions, :suprise)
  end
end
