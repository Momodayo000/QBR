class Public::MenusController < ApplicationController

  def index
    @menus = Menu.all
  end
end
