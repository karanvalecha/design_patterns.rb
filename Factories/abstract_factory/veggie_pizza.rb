require './pizza.rb'

class VeggiePizza < Pizza

  def initialize(factory)
    @factory = factory
  end

  def prepare
    super(@factory)
    @veggies = @factory.create_veggies
  end
end
