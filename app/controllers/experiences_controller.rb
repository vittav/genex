class ExperiencesController < ApplicationController

  def index
    @experiences = Experience.all
  end

  def show
    @experience = Experience.find(params[:id])
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(strong_params)
    @experience.save
    @experience.user = current_user
    if @experience.save
      redirect_to 'home'
    else
      render 'new'
    end
  end

  def edit
    @experience = Experience.find(params[:id])
  end

  def update
    @experience = Experience.find(params[:id])
    @experience.update(strong_params)
  end

  def destroy
    @experience = Experience.find(params[:id])
    @experience.destroy
    redirect_to 'home'
  end

  private

  def strong_params
    params.require(:experience).permit(:first_name, :last_name, :gender, :age, :location, :photo)
  end

end
