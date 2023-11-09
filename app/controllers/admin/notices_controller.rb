class Admin::NoticesController < ApplicationController

  def index
    @notices = Notice.page(params[:page]).per(10).order(created_at: :desc)
    @tag_list = Tag.all
  end

  def show
    @notice = Notice.find(params[:id])
    @notice_tags = @notice.tags
  end

  def new
    @notice = Notice.new
  end

  def create
    @notice = Notice.new(notice_params)
    tag_list=params[:notice][:name].split(',')
    if @notice.save
      @notice.save_tag(tag_list)
      redirect_to admin_notices_path
    else
      render 'new'
    end
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

  private

    def notice_params
      params.require(:notice).permit(:title, :deadline, :explanation)
    end
end
