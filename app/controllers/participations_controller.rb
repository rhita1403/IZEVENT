class ParticipationsController < ApplicationController
  def new
    @participation = Participation.new
    @event = Event.find(params[:event_id])
    authorize @participation
  end

  def create
    @participation = Participation.new(participation_params)
    authorize @participation
    @event = Event.find(params[:event_id])
    @participation.event = @event
    if @participation.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @participation = Participation.find(params[:id])
    authorize @participation
  end

  def update
    @participation = Participation.find(params[:id])
    authorize @participation
    @participation.update(participation_params)
    redirect_to event_path(@event)
  end

  def confirm
    @participation = Participation.find(params[:id])
    authorize @participation
    @participation.update(participating: true)
    redirect_to dashboard_path, notice: 'Participation confirmée avec succès.'
  end

  def decline
    @participation = Participation.find(params[:id])
    authorize @participation
    @participation.update(participating: false)
    redirect_to dashboard_path, notice: 'Participation refusée avec succès.'
  end

  def destroy
    @participation = Participation.find(params[:id])
    @participation.destroy
    redirect_to event_path(@participation.event)
  end

  private

  def participation_params
    params.require(:participation).permit(:user_id)
  end

  # def set_user
  #   @user = User.find(params[:user_id])
  # end

  # def set_event
  #   @event = Event.find(params[:event_id])
  # end
end
