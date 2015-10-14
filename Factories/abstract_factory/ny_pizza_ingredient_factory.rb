require './ingredients.rb'

include Ingredients

class NyPizzaIngredientFactory
  def create_dough
    Dough::ThinCrust.new
  end

  def create_sauce
    Sauce::Marinara.new
  end

  def create_cheese
    Cheese::Reggiano.new
  end

  def create_veggies
    ["onion", "mushrooms", "red peppers"]
  end

  def create_pepperoni
    Pepperoni::Sliced.new
  end

  def create_clam
    Clams::Fresh.new
  end
end
