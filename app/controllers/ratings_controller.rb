class RatingsController < ApplicationController
  # new_booking_rating GET    /bookings/:booking_id/ratings/new

  def show
    @booking = Booking.find(params[:booking_id])
    @rating = Rating.all
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @rating = Rating.new
    authorize @rating
  end

  def create
    @rating = Rating.new(rating_params)
    @booking = Booking.find(params[:booking_id])
    @rating.booking = @booking
    authorize @rating
    if @rating.save
      redirect_to experience_path(@booking.experience)
      flash[:notice] = 'Thank you for reviewing this date!'
    else
      # render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @rating = Rating.find(params[:id])
    authorize @rating
    @rating.destroy

    redirect_to ratings_path, status: :see_other
    flash[:notice] = 'Successfully Deleted'
  end

  private

  def rating_params
    params.require(:rating).permit(:stars, :comment)
  end
end
