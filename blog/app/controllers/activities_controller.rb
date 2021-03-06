class ActivitiesController < ApplicationController

  def index
  	@activities = Activity.all
    @admin = current_user.admin
  end

  def new
  	@activity = Activity.new
  end

  def create
  	@activity = Activity.create(activity_params)
  	redirect_to action: "index"
  end

  def destroy
    #TODO what to do with user associations?
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to action: "index"
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
 
    if @activity.update(activity_params)
      redirect_to action: "index"
    else
      render 'edit'
    end
  end

  private
  def activity_params
      params.require(:activity).permit(:description, :value)
  end
end