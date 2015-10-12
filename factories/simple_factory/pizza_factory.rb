require './pizzas'
include Pizzas

class PizzaFactory

  def create_pizza(type)
    Object.const_get("Pizzas").const_get("#{type.capitalize}Pizza").new
  end

end
