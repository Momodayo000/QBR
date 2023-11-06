class Public::ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
  end

  def new
    @reservation = Reservation.new
    @day = params[:day]
    @time = params[:time]
    @start_time = DateTime.parse(@day + " " + @time + " " + "JST")
  end

  def complete
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservations_path @reservation.id
    else
      render :new
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      redirect_to mypage_customers_path(current_customer.id)
    else
      render :show
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:day, :time, :customer_id, :start_time)
  end
end
