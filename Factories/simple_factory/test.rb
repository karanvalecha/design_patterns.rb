require 'test/unit'
require './pizza'
require './pizzas'
require './pizza_store'
require './pizza_factory'


class SimpleFactoryTest < Test::Unit::TestCase
  def test_factory
    factory = PizzaFactory.new
    assert(factory.create_pizza("cheese").instance_of?(CheesePizza))
    assert(factory.create_pizza("veggie").instance_of?(VeggiePizza))
  end

  def test_store_init
    factory = PizzaFactory.new
    store = PizzaStore.new(factory)
    assert_equal(store.factory, factory)
  end

  def test_order_pizza
    store = PizzaStore.new(PizzaFactory.new)
    assert(store.order_pizza("cheese").instance_of?(CheesePizza))
    assert(store.order_pizza("veggie").instance_of?(VeggiePizza))
  end

end
