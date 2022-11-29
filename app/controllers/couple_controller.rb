class CoupleController < ApplicationController
  before_action :find_couple, only: %i[edit update]

  def new
  end

  def create
    @couple = Couple.new
    if @couple.save
      current_user.couple = @couple
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    current_user.couple = @couple
    redirect_to '/', status: :see_other
  end


  private

  def find_couple
    @couple = Couple.find(params[:id])
  end
end
