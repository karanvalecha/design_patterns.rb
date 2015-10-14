require './pizza.rb'

class CheesePizza < Pizza

  def initialize(factory)
    @factory = factory
  end

  def prepare
   super(@factory)
  end
end
