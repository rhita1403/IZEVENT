class TasksController < ApplicationController
  def new
    @task = Task.new
    authorize @task
    @event = Event.find(params[:event_id])
  end

  def create
    @task = Task.new(task_params)
    authorize @task
    @event = Event.find(params[:event_id])
    @task.event = @event
    if @task.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
    authorize @task
    @event = Event.find(params[:event_id])
    @task.event = @event
    if @task.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def update
  #   @task = Task.find(params[:id])
  #   @task.update(task_params)
  #   redirect_to task_path(@task)
  # end

  private

  def task_params
    params.require(:task).permit(:description, :cost, :user_id)
  end
end
