class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :find_experience, only: %i[show favorite unfavorite]

  def index
    @experiences = policy_scope(Experience)
    if params[:query].present?
      sql_query = "title ILIKE :query OR description ILIKE :query"
      @experiences = Experience.where(sql_query, query: "%#{params[:query]}%")
    else
      @experiences
    end
  end

  def show
    authorize @experience
  end

  def favorite
    authorize @experience
    current_user.favorite(@experience)
    @experience.save
    puts "hi there"
    respond_to do |format|
      # format.turbo_stream { render turbo_stream: turbo_stream.replace('dom_id(@experience, :favourite)', partial: 'experiences/index_card', locals: { experience: @experience} )}
      format.turbo_stream
      format.html { redirect_to @experience, status: :see_other, notice: "Favorite Added" }
    end
  end

  def unfavorite
    authorize @experience
    current_user.unfavorite(@experience)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to experiences_path, status: :see_other, notice: "Favorite removed" }
    end
  end

  private

  def find_experience
    @experience = Experience.find(params[:id])
  end
end
