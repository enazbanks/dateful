class SpecialdaysController < ApplicationController
  def index
    @special_days.user[:id]
    if params[:special_days].present?
      @special_days
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @special_day = Special_day.find(params[:special_days_id])
    @special_day = Special_day.new
    authorize @special_days
  end

  def create
    @special_day = Special_day.new(special_day_params)
    @special_day = Special_day.find(params[:special_days_id])
    authorize @special_day
    if @@special_day.save
      redirect_to @special_day_path(@special_day.special_day)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def special_day_params
    params.require(:special_days).permit(:name, :date)
  end
end
