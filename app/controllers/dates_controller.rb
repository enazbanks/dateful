class DatesController < ApplicationController
  def index
    @dates = policy_scope(Date)
  end

  def show
    authorize @date
  end
end
