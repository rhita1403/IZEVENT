class ParticipationsController < ApplicationController
  def new
    @participation = Participation.new
  end
  # est-ce qu'on a besoin du new?

  def create
    @participation = Participation.new(participation_params)
    @participation.user = @user
    @participation.event = @event
    @participation.save
    if @participation.save
      redirect_to participation_path(@participation)
    else
      render :new, status: :unprocessable_entity
    end
  end
  # le path est correct?

  def edit
    @participation = Participation.find(params[:id])
  end

  def update
    @participation = Participation.find(params[:id])
    @participation.update(participation_params)
    redirect_to participation_path(@participation)
  end

  private

  def participation_params
    params.require(:participation).permit(:participating)
  end
  # faut mettre quoi dans permit?

  def set_user
    @user = User.find(params[:user_id])
  end
  # ca va fonctionner ça?

  def set_event
    @event = Event.find(params[:event_id])
  end
  # ca va fonctionner ça?
end
