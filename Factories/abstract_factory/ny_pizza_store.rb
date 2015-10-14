require './pizza_store'
require './cheese_pizza'
require './veggie_pizza'
require './clam_pizza'
require './pepperoni_pizza'
require './ny_pizza_ingredient_factory'

class NyPizzaStore < PizzaStore

  def initialize
    @factory = NyPizzaIngredientFactory.new
  end

  def create_pizza(type)
    @pizza = nil

    case type
    when "cheese"
      @pizza = CheesePizza.new(@factory)
      @pizza.name = "New York style Cheese Pizza"
    when "veggie"
      @pizza = VeggiePizza.new(@factory)
      @pizza.name = "New York style Veggie Pizza"
    when "clam"
      @pizza = ClamPizza.new(@factory)
      @pizza.name = "New York style Clam Pizza"
    when "pepperoni"
      @pizza = PepperoniPizza.new(@factory)
      @pizza.name = "New York style Pepperoni Pizza"
    else
      nil
    end
    @pizza
  end

end
