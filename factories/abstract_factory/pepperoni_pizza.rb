require './pizza.rb'

class PepperoniPizza < Pizza

  def initialize(factory)
    @factory = factory
  end

  def prepare
    super(@factory)
    @pepperoni = @factory.create_pepperoni
    @veggies = @factory.create_veggies
  end
end
