class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home]

  def home
    @experiences = Experience.all.first(5)
  end
end
