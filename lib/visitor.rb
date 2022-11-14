class Visitor

  attr_reader :name,
              :height,
              :preferences
              
  def initialize(name, height, spending_money)
    @name           = name
    @height         = height
    @spending_money = spending_money
    @preferences    = []
  end

  def spending_money
    @spending_money.delete('$').to_f.round(2)
  end
end
