require './ingredients.rb'

include Ingredients

class ChicagoPizzaIngredientFactory
  def create_dough
    Dough::ThickCrust.new
  end

  def create_sauce
    Sauce::PlumTomato.new
  end

  def create_cheese
    Cheese::Mozzarella.new
  end

  def create_veggies
    ["black olives", "spinach", "eggplant"]
  end

  def create_pepperoni
    Pepperoni::Sliced.new
  end

  def create_clam
    Clams::Frozen.new
  end
end
