class MeetingsController < ApplicationController

  def index
    @meetings = Meeting.all
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

  def new
    @meeting = Meeting.new
    authorize @meeting
  end

  def create
    @meeting = Meeting.new(strong_params)
    @meeting.user = current_user
    authorize @meeting
    if @meeting.save
      redirect_to my_meetings_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    authorize @meeting
    @meeting.destroy
    redirect_to my_meetings_path
  end

  def my_meetings
    @meetings = Meeting.where(user_id: current_user)
    authorize @meetings
  end

  private

  def strong_params
    params.require(:meeting).permit(:experience_id, :scheduled_time, :location)
  end
end
