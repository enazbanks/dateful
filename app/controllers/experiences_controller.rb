class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :find_experience, only: %i[show favorite unfavorite secret unsecret]

  def index
    @experiences = policy_scope(Experience)
    if params[:query].present?
      sql_query = "title ILIKE :query OR description ILIKE :query"
      @experiences = Experience.where(sql_query, query: "%#{params[:query]}%")
    end
    # The `geocoded` scope filters only flats with coordinates
    @markers = @experiences.geocoded.map do |experience|
      {
        lat: experience.latitude,
        lng: experience.longitude,
        info_window: render_to_string(partial: "info_window", locals: { experience: experience }),
        image_url: helpers.asset_url("location_drop_heart.svg")
      }
    end
  end

  def mood
    authorize Experience
    @experiences = policy_scope(Experience).select { |exp| exp.mood_list.include?(params[:query]) }
    @mood = params[:query]
  end

  def show
    authorize @experience
    @booking = Booking.new
    @rating = Rating.new
    @page = params[:page] ? params[:page].to_i : 1
    @next_page = @page + 1
    @ratings = @experience.ratings.limit(4).offset(@page * 4)
    @ratings = @ratings.sort_by{|rating| rating.booking.when}.reverse
    respond_to do |format|
      format.turbo_stream
      format.html
    end
    @markers = [
      {
        lat: @experience.latitude,
        lng: @experience.longitude,
        info_window: render_to_string(partial: "experiences/info_window", formats: [:html], locals: { experience: @experience }),
        image_url: helpers.asset_url("location_drop_heart.svg")
      }
    ]

    @icons = {
      "Relaxed" => "icon_relax.png",
      "Romantic" => "icon_adventure.png",
      "Adventurous" => "icon_adventure.png",
      "Roadtrip" => "icon_roadtrip.png",
      "Foodie" => "icon_foodie.png",
      "Home" => "icon_home.png",
      "Active" => "icon_camping.png",
      "Pamper" => "icon_relaxing.png",
      "Night" => "icon_night.png",
      "Instagrammable" => "icon.walk.png",
      "Playful" => "icon_playful.png",
      "Spicy" => "icon_romance.png"
    }
    # for each img url = hash value
  end

  def favorite
    authorize @experience
    current_user.favorite(@experience)
    @experience.save
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back fallback_location: experiences_path, status: :see_other, notice: "Favorite Added" }
    end
  end

  def secret
    authorize @experience
    @experience.secret_list.add(current_user.id)
    @experience.save
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back fallback_location: experiences_path, status: :see_other, notice: "Secret Favourite" }
    end
  end

  def unsecret
    authorize @experience
    @experience.secret_list.remove(current_user.id.to_s)
    @experience.save
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back fallback_location: experiences_path, status: :see_other, notice: "Secret Favourite" }
    end
  end

  def unfavorite
    authorize @experience
    current_user.unfavorite(@experience)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back fallback_location: experiences_path, status: :see_other, notice: "Secret removed" }
    end
  end

  def my_favorite
    authorize Experience
    @experiences = policy_scope(Experience).select { |exp| exp.favorited_by?(current_user) || exp.favorited_by?(current_user.partner) || exp.secret_list.include?(current_user.id.to_s) }
  end

  private

  def find_experience
    @experience = Experience.find(params[:id])
  end
end
