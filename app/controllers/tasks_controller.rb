class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = @user
    @task.event = @event
    @task.save

    if @task.save
      redirect_to task_path(@task)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def task_params
    params.require(:task).permit(:description, :cost, photos: [])
  end
end
