class Visitor

  attr_reader :name,
              :height,
              :spending_money,
              :preferences

  def initialize(name, height, spending_money)
    @name           = name
    @height         = height
    @spending_money = spending_money.delete('$').to_f.round(2)
    @preferences    = []
  end

  def add_preference(preference)
    preferences.push(preference)
  end

  def tall_enough(threshold)
    @height >= threshold
  end

  def spend_money(amount)
    @spending_money -= amount unless (spending_money - amount) < 0
  end

  def interested?(ride)
    @preferences.any? { |preference| preference == ride.excitement }
  end
end
