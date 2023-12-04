class EventsController < ApplicationController
  helper_method :total_cost, :average_cost_per_user, :average_rating
  def index
    @events = Event.all
    @events = policy_scope(Event)
  end

  def show
    @event = Event.find(params[:id])
    @chatroom = @event.chatroom
    @message = Message.new
    @reviews = @event.reviews
    authorize @event
    @tasks = @event.tasks
    @participations = @event.participations
    if @event.geocode
      @marker = [
      lat: @event.geocode[0],
      lng: @event.geocode[1]
      ]
    end
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    authorize @event
    @event.user = current_user
    @event.save
    if @event.save
      @participation = Participation.create(user: current_user, event: @event, participating: true)
      @chatroom = Chatroom.create(name: "Communiquez ici!", event: @event)
      redirect_to add_participation_event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def add_participation
    skip_authorization
    @event = Event.find(params[:id])
    @users = User.where.not(id: @event.user.id)
  end

  def add_multiple_participations
    skip_authorization
    @event = Event.find(params[:id])
    @users = params[:users]

    @users.each do |user|
      Participation.create(user_id: user.to_i, event_id: @event.id)
    end
    redirect_to new_event_task_path(@event)
  end

  def add_task
    skip_authorization
    @event = Event.find(params[:id])
  end

  def add_multiple_tasks
    skip_authorization
    @event = Event.find(params[:id])

    @descriptions = params[:descriptions]
    costs = params[:costs]

    @descriptions.each_with_index do |desc, index|
      Task.create(description: desc, cost: costs[index], event_id: @event.id)
    end
    redirect_to event_path(@event)
  end

  def total_cost
    total_cost = 0
    @event.tasks.each do |task|
      total_cost += task.cost
    end
    total_cost
  end

  def average_cost_per_user
    (total_cost / @event.participations.count).round(2)
  end

  def edit
    @event = Event.find(params[:id])
    authorize @event
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to event_path(@event)
    authorize @event
  end

  def destroy
    @event = Event.find(params[:id])
    authorize @event
    @event.destroy
    redirect_to events_path, status: :see_other
  end

  def average_rating
    total_rating = 0
    @event.reviews.each do |review|
      total_rating += review.rating
    end
    (total_rating / @event.reviews.count).round(0)
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :date, :description, :photo)
  end
end
