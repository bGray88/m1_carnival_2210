class Ride

  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :total_revenue,
              :rider_log,
              :rider_count

  def initialize(args)
    @name          = args[:name]
    @min_height    = args[:min_height]
    @admission_fee = args[:admission_fee]
    @excitement    = args[:excitement]
    @total_revenue = 0
    @rider_log     = Hash.new(0)
    @rider_count   = 0
  end

  def board_rider(rider)
    @rider_log[rider] 
  end

  def count_rider
    @rider_count += 1
  end
end
