class Public::ReviewsController < ApplicationController

  def index
  end

  def create
    @notice = Notice.find(params[:notice_id])
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    @review.notice_id = @notice.id
    if @review.save!
      redirect_to notice_path(@review.notice)
    else
      render "index"
    end
  end

  private

  def review_params
    params.require(:review).permit(:notice_id, :score, :content)
  end
end
