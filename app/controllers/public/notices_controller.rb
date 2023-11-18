class Public::NoticesController < ApplicationController

  def index
    @notices = Notice.page(params[:page]).per(10).order(created_at: :desc)
    @tag_list = Tag.all
  end

  def show
    @notice = Notice.find(params[:id])
    @notice_tags = @notice.tags
    @review = Review.new
    @reviews = @notice.reviews
  end

  def create
  end

  def update
  end

  def destroy
  end

  def search_tag
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @notices = @tag.notices
  end
end
