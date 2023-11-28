class ReviewsController < ApplicationController
  before_action :set_event, only: %i[new create]
  def new
    @review = Review.new
  end

  def create
    @review = review.new(review_params)
    @review.event = @event
    @review.save
    if @review.save
      redirect_to review_path(@review)
    else
      render :new, status: :unprocessable_entity
    end
  end
  # path va-t-il fonctionner?

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def review_params
    params.require(:review).permit(:rating, :feedback)
  end
end
