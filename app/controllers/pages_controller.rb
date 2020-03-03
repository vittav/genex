class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home, :root]

  def home
    @experiences = Experience.new
    if params[:query].present?
      redirect_to experiences_path(params[:query])
    end

  end
end
