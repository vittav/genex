class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home, :root]

  # def home
  #   @experiences = Experience.all.first(5)
  # end


  def home

    @experiences = Experience.new
    if params[:query].present?
      redirect_to experiences_path(params[:query])
    end


    @experiences = Experience.geocoded

    @markers = @experiences.map do |experience|
      {
        lat: experience.latitude,
        lng: experience.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { experience: experience })
      }
    end

  end

end


