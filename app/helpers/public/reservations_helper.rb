module Public::ReservationsHelper
  def times
    times = ["9:00",
             "11:00",
             "14:00",
             "16:00",
             "18:00"]
  end

  def check_reservation(reservations, day, time)
    result = false
    reservations_count = reservations.count
    if reservations_count > 1
      reservations.each do |reservation|
        result = reservation[:day].eql?(day.strftime("%Y-%m-%d")) && reservation[:time].eql?(time)
        return result if result
      end
    elsif reservations_count == 1
      result = reservations[0][:day].eql?(day.strftime("%Y-%m-%d")) && reservations[0][:time].eql?(time)
      return result if result
    end
    return result
  end
end
