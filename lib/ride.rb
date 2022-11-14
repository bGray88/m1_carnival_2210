class Ride

  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement
              
  def initialize(args)
    @name          = args[:name]
    @min_height    = args[:min_height]
    @admission_fee = args[:admission_fee]
    @excitement    = args[:excitement]
  end
end
