class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def index
  end

  def home
  end

  def dashboard
    @my_events = Event.where(user_id: current_user.id)
    @user = current_user
    @participations = @user.participations
  end
end
