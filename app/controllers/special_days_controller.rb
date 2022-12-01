class SpecialDaysController < ApplicationController
  def index
    @special_days = policy_scope(SpecialDay)
    @special_day = SpecialDay.new
    # authorize @special_day
  end

  def create
    @special_day = SpecialDay.new(special_day_params)
    @special_day.couple = current_user.couple
    authorize @special_day
    if @special_day.save
      redirect_to special_days_path, notice: "Special Day was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @special_day.delete
    redirect_to special_days_path
  end

  private

  def special_day_params
    params.require(:special_day).permit(:title, :date)
  end
end
