class Public::NoticesController < ApplicationController

  def index
    @notices = Notice.page(params[:page]).per(10).order(created_at: :desc)
    @tag_list = Tag.all
  end

  def show
    @notice = Notice.find(params[:id])
    @notice_tags = @notice.tags
  end

  def create
  end

  def update
  end

  def destroy
  end
end
