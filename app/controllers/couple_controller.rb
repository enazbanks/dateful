class CoupleController < ApplicationController
  before_action :find_couple, only: %i[edit update]


  private

  def find_meal
    @couple = Couple.find(params[:id])
  end
end
