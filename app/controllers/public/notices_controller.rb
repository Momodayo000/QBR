class Public::NoticesController < ApplicationController

  def index
    @notices = Notice.page(params[:page]).per(10).order(created_at: :desc)
  end

  def show
    @notice = Notice.find(params[:id])
  end

  def create
  end

  def update
  end

  def destroy
  end
end
