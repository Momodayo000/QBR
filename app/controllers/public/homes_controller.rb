class Public::HomesController < ApplicationController

  def top
    @notices = Notice.all.order(created_at: :desc)
  end
end
