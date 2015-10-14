require './pizza_store'
require './cheese_pizza'
require './veggie_pizza'
require './clam_pizza'
require './pepperoni_pizza'
require './chicago_pizza_ingredient_factory'

class ChicagoPizzaStore < PizzaStore
  def initialize
    @factory = ChicagoPizzaIngredientFactory.new
  end

  def create_pizza(type)
    @pizza = nil

    case type
    when "cheese"
      @pizza = CheesePizza.new(@factory)
      @pizza.name = "Chicago Style Cheese Pizza"
    when "veggie"
      @pizza = VeggiePizza.new(@factory)
      @pizza.name = "Chicago Style Veggie Pizza"
    when "clam"
      @pizza = ClamPizza.new(@factory)
      @pizza.name = "Chicago Style Clam Pizza"
    when "pepperoni"
      @pizza = PepperoniPizza.new(@factory)
      @pizza.name = "Chicago Style Pepperoni Pizza"
    else
      nil
    end
    @pizza
  end

end
