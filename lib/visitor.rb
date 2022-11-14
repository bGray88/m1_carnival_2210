class Visitor

  attr_reader :name,
              :height
  def initialize(name, height)
    @name   = name
    @height = height
  end
end
