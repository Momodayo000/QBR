class Admin::MenusController < ApplicationController

  def index
    @menus = Menu.page(params[:page]).per(6)
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to admin_menus_path
    else
      @menus = Menu.page(params[:page]).per(6)
      render 'index'
    end
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to admin_menus_path
  end

  private

  def menu_params
    params.require(:menu).permit(:menu_title, :menu_sub_title, :menu_explanation, :price)
  end
end
