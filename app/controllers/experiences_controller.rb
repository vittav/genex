class ExperiencesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @experiences = policy_scope(Experience).order(created_at: :desc)
  end

  def show
    @experience = Experience.find(params[:id])
  end

  def new
    @experience = Experience.new
    authorize @experience
  end

  def create
    @experience = Experience.new(strong_params)
    @experience.user = current_user
    authorize @experience
    if @experience.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @experience = Experience.find(params[:id])
    authorize @experience
  end

  def update
    @experience = Experience.find(params[:id])
    authorize @experience
    @experience.update(strong_params)
  end

  def destroy
    @experience = Experience.find(params[:id])
    authorize @experience
    @experience.destroy
    redirect_to 'home'
  end

  private

  def strong_params
    params.require(:experience).permit(:first_name, :last_name, :gender, :age, :location, :photo)
  end

end
