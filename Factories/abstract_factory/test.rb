require 'test/unit'
require './pizza'
require './cheese_pizza'
require './veggie_pizza'
require './clam_pizza'
require './pepperoni_pizza'
require './ny_pizza_store'
require './chicago_pizza_store'
require './ingredients.rb'
include Ingredients
class FactoryMethodTest < Test::Unit::TestCase

  def test_ny_pizza_store_cheese_pizza
    store = NyPizzaStore.new
    # use is_a? to ensure inheritance
    assert(store.is_a?(PizzaStore))

    # test create_pizza
    @pizza = store.create_pizza("cheese")
    assert_equal(CheesePizza, @pizza.class)

    # test order_pizza and pizza ingredients
    @pizza = store.order_pizza("cheese")
    assert_equal(CheesePizza, @pizza.class)
    assert_equal(Ingredients::Dough::ThinCrust, @pizza.dough.class)
    assert_equal(Ingredients::Sauce::Marinara, @pizza.sauce.class)
    assert_equal(Ingredients::Cheese::Reggiano, @pizza.cheese.class)
    assert_equal(nil, @pizza.pepperoni)
    assert_equal(nil, @pizza.clam)
    assert_equal(nil, @pizza.veggies)
  end

  def test_ny_pizza_store_veggie_pizza
    store = NyPizzaStore.new
    # use is_a? to ensure inheritance
    assert(store.is_a?(PizzaStore))

    # test create_pizza
    @pizza = store.create_pizza("veggie")
    assert_equal(VeggiePizza, @pizza.class)

    # test order_pizza and pizza ingredients
    @pizza = store.order_pizza("veggie")
    assert_equal(VeggiePizza, @pizza.class)
    assert_equal(Ingredients::Dough::ThinCrust, @pizza.dough.class)
    assert_equal(Ingredients::Sauce::Marinara, @pizza.sauce.class)
    assert_equal(Ingredients::Cheese::Reggiano, @pizza.cheese.class)
    assert_equal(nil, @pizza.pepperoni)
    assert_equal(nil, @pizza.clam)
    assert_equal(["onion", "mushrooms", "red peppers"], @pizza.veggies)
  end

  def test_ny_pizza_store_clam_pizza
    store = NyPizzaStore.new
    # use is_a? to ensure inheritance
    assert(store.is_a?(PizzaStore))

    # test create_pizza
    @pizza = store.create_pizza("clam")
    assert_equal(ClamPizza, @pizza.class)

    # test order_pizza and pizza ingredients
    @pizza = store.order_pizza("clam")
    assert_equal(ClamPizza, @pizza.class)
    assert_equal(Ingredients::Dough::ThinCrust, @pizza.dough.class)
    assert_equal(Ingredients::Sauce::Marinara, @pizza.sauce.class)
    assert_equal(Ingredients::Cheese::Reggiano, @pizza.cheese.class)
    assert_equal(nil, @pizza.pepperoni)
    assert_equal(Ingredients::Clams::Fresh, @pizza.clam.class)
    assert_equal(nil, @pizza.veggies)
  end

  def test_ny_pizza_store_pepperoni_pizza
    store = NyPizzaStore.new
    # use is_a? to ensure inheritance
    assert(store.is_a?(PizzaStore))

    # test create_pizza
    @pizza = store.create_pizza("pepperoni")
    assert_equal(PepperoniPizza, @pizza.class)

    # test order_pizza and pizza ingredients
    @pizza = store.order_pizza("pepperoni")
    assert_equal(PepperoniPizza, @pizza.class)
    assert_equal(Ingredients::Dough::ThinCrust, @pizza.dough.class)
    assert_equal(Ingredients::Sauce::Marinara, @pizza.sauce.class)
    assert_equal(Ingredients::Cheese::Reggiano, @pizza.cheese.class)
    assert_equal(Ingredients::Pepperoni::Sliced, @pizza.pepperoni.class)
    assert_equal(nil, @pizza.clam)
    assert_equal(["onion", "mushrooms", "red peppers"], @pizza.veggies)
  end

  def test_chicago_pizza_store_clam_pizza
    store = ChicagoPizzaStore.new
    assert(store.is_a?(PizzaStore))
    # test create_pizza
    @pizza = store.create_pizza("clam")
    assert_equal(ClamPizza, @pizza.class)

    # test order_pizza
    @pizza = store.order_pizza("clam")
    assert_equal(ClamPizza, @pizza.class)
  end

  def test_chicago_pizza_store_cheese_pizza
    store = ChicagoPizzaStore.new
    assert(store.is_a?(PizzaStore))
    # test create_pizza
    @pizza = store.create_pizza("cheese")
    assert_equal(CheesePizza, @pizza.class)

    # test order_pizza
    @pizza = store.order_pizza("cheese")
    assert_equal(CheesePizza, @pizza.class)
  end

  def test_chicago_pizza_store_pepperoni_pizza
    store = ChicagoPizzaStore.new
    assert(store.is_a?(PizzaStore))
    # test create_pizza
    @pizza = store.create_pizza("pepperoni")
    assert_equal(PepperoniPizza, @pizza.class)

    # test order_pizza
    @pizza = store.order_pizza("pepperoni")
    assert_equal(PepperoniPizza, @pizza.class)
  end

  def test_chicago_pizza_store_veggie_pizza
    store = ChicagoPizzaStore.new
    assert(store.is_a?(PizzaStore))
    # test create_pizza
    @pizza = store.create_pizza("veggie")
    assert_equal(VeggiePizza, @pizza.class)

    # test order_pizza
    @pizza = store.order_pizza("veggie")
    assert_equal(VeggiePizza, @pizza.class)
  end
end
