class PizzaStore

  attr_reader :factory

  def initialize(factory)
    @factory = factory
  end

  def order_pizza(type)
    pizza = @factory.create_pizza(type)

    pizza.prepare
    pizza.bake
    pizza.cut
    pizza.box

    pizza
  end

end
