require './DuckProperties'
class Duck
  attr_accessor :name

  def initialize(name = nil)
    @name = name
  end

  def name
    return @name if @name
    raise NotImplementedError, "'name' is not set"
  end

  def swim
    return "'#{@name}' is swimming!" if @name
    raise NotImplementedError, "'name' is not set"
  end

  def fly
    raise NotImplementedError, "'FlyBehaviour' is not defined"
  end

  def quack
    raise NotImplementedError, "'QuackBehaviour' is not defined"
  end

end
