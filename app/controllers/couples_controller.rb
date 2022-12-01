class CouplesController < ApplicationController
  before_action :find_couple, only: %i[edit update]

  def new
    @couple = Couple.new
    authorize @couple
  end

  def create
    @couple = Couple.new
    authorize @couple
    if @couple.save
      current_user.couple = @couple
      current_user.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def join
    partner = User.find_by(email: params[:email])
    if partner
      @couple = partner.couple
      current_user.couple = @couple
      current_user.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def find_couple
    @couple = Couple.find(params[:id])
  end
end
