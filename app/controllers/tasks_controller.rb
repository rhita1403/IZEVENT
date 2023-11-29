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
      redirect_to new_event_task_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
    authorize @task
    @event = Event.find(params[:event_id])
  end

  def update
    @task = Task.find(params[:id])
    authorize @task
    @task.update(task_params)
    redirect_to event_path(@task.event)
  end

  def destroy
    skip_authorization
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to event_path(@task.event)
  end

  private

  def task_params
    params.require(:task).permit(:description, :cost, :user_id)
  end
end
