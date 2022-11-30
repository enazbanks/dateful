class RatingsController < ApplicationController
  # new_booking_rating GET    /bookings/:booking_id/ratings/new
  def new
    @booking = Booking.find(params[:booking_id])
    @rating = Rating.new
    authorize @rating
  end

  def create
    @rating.user = current_user
    @rating = Rating.new(rating_params)
    @booking = Booking.find(params[:booking_id])
    @rating.booking = @booking
    authorize @rating
    if @rating.save
      redirect_to experience_path(@booking.experience)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:stars, :comment)
  end
end
