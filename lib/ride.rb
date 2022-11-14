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
  end

  def board_rider(rider)
    @rider_log[rider] += 1
    pay_to_ride(rider)
  end

  def pay_to_ride(rider)
    rider.spend_money(@admission_fee)
    @total_revenue += @admission_fee
  end

  def valid_rider(rider)
    rider.tall_enough(min_height) && rider.pre
  end
end
