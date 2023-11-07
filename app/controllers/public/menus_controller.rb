class Public::MenusController < ApplicationController

  def index
    @menus = Menu.page(params[:page]).per(6)
  end
end
