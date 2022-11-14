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

  def add_preference(preference)
    preferences.push(preference)
  end

  def tall_enough(threshold)
    @height >= threshold
  end
end
