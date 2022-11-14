class Carnival

  attr_reader :duration

  def initialize
    @duration = 10
    @rides    = []
  end

  def rides
    @rides
  end

  def add_ride(ride)
    @rides.push(ride)
  end

  def most_popular_ride
    popular_rides = @rides.sort_by { |ride| ride.popularity }.reverse
    [popular_rides[0]] unless tie?(popular_rides)
    popular_rides.select { |ride| ride.popularity == popular_rides[0].popularity }
  end

  def tie?(rides)
    return rides[0] == rides[1] if rides.length > 1
    false
  end

  def most_profitable_ride
    profitable_rides = @rides.sort_by { |ride| ride.total_revenue }.reverse
    [profitable_rides[0]] unless tie?(profitable_rides)
    profitable_rides.select { |ride| ride.total_revenue == profitable_rides[0].total_revenue }
  end

  def total_revenue_all
    @rides.sum { |ride| ride.total_revenue }
  end
end
