class Admin::NoticesController < ApplicationController

  def index
    @notices = Notice.page(params[:page]).per(10).order(created_at: :desc)
  end

  def show
    @notice = Notice.find(params[:id])
  end

  def new
    @notice = Notice.new
  end

  def create
    @notice = Notice.new(notice_params)
    if @notice.save
      redirect_to admin_notices_path
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  private

    def notice_params
      params.require(:notice).permit(:title, :deadline, :explanation)
    end
end
