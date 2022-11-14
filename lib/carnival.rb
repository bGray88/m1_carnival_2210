class Carnival

  attr_reader :duration

  def initialize()
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
    rides = @rides.sort_by { |ride| ride.popularity }.reverse
    rides[0] unless popular_tie?(rides)

  end

  def popular_tie?(rides)
    return rides[0] == rides[1] if rides.length > 1
    false
  end
end
