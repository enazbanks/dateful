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
      redirect_to bookings_path
      flash[:notice] = 'Successfully Booked'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  # PATCH  /bookings/:id
  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.update(booking_params)
      redirect_to bookings_path
      flash[:notice] = 'Successfully updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy

    redirect_to bookings_path, status: :see_other
    flash[:notice] = 'Successfully Deleted'
  end

  private

  def booking_params
    params.require(:booking).permit(:when, :instructions, :suprise)
  end
end
