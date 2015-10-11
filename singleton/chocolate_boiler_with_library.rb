require 'singleton'

class ChocolateBoiler
  include Singleton

  def initialize
    @empty = true
    @boiled = false
  end

  def fill
    if empty?
      @empty = false
      @boiled = false
      # fill the boiler with milk/chocolate
    end
  end

  def drain
    if (!empty? and !boiled?)
      # drain the boiler
      @empty = true
    end
  end

  def boil
    if (!empty? and !boiled?)
      # bring contents to a boil
      @boiled = true
    end
  end

  def empty?
    @empty
  end

  def boiled?
    @boiled
  end
end
