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
      params_language = params[:experience][:language]
      params_skill = params[:experience][:skill]
      @language = Language.new(name: params_language[:name], level: params_language[:level], experience_id: current_user.experience.last.id)
      @skill = Skill.new(name: params_skill[:name], level: params_skill[:level], description: params_skill[:description], experience_id: current_user.experience.last.id)
      @language.save
      @skill.save
      redirect_to root_path
      #flash[:success] = "Experience created"
    else
      render 'new'
      #flash[:danger] = "Experience not created"
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
    redirect_to experience_path(@experience)
  end

  def destroy
    @experience = Experience.find(params[:id])
    authorize @experience
    @experience.destroy
    redirect_to :root
  end

  def my_experiences
    @experiences = Experience.where(user_id: current_user)
    authorize @experiences
  end

  private

  def strong_params
    params.require(:experience).permit(:first_name, :last_name, :gender, :age, :location, :photo)
  end

end
