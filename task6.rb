class Dessert
  attr_accessor :name, :calories

  def initialize(name, calories = 0)
    @name = name
    @calories = calories
  end

  def healthy?
    @calories < 200
  end

  def delicious?
    true
  end
end

class JellyBean < Dessert
  attr_accessor :flavor

  def delicious?
    @flavor == 'black licorice'
  end
end
