class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :find_experience, only: :show

  def index
    @experiences = policy_scope(Experience)
  end

  def show
    authorize @experience
  end

  private

  def find_experience
    @experience = Experience.find(params[:id])
  end
end
