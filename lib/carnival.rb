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
end
