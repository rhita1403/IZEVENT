class EventsController < ApplicationController
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
      @chatroom = Chatroom.create(name: "Welcome to #{@event.title}", event: @event)
      redirect_to new_event_participation_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
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

  private

  def event_params
    params.require(:event).permit(:title, :location, :date, :description)
  end
end
