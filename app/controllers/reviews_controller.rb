class ReviewsController < ApplicationController
  before_action :set_event, only: %i[new create]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.event = @event
    @review.save
    if @review.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @review = Review.find(params[:id])
    @event = Event.find(params[:event_id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to event_path(@review.event)
  end


  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def review_params
    params.require(:review).permit(:rating, :feedback)
  end
end
