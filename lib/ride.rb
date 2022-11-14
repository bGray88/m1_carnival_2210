class Ride

  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :total_revenue

  def initialize(args)
    @name          = args[:name]
    @min_height    = args[:min_height]
    @admission_fee = args[:admission_fee]
    @excitement    = args[:excitement]
    @total_revenue = 0
  end
end
