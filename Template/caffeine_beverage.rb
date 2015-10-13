class CaffeineBeverage

  def prepare
    str = "Starting:\n"
    str += "1. #{boil_water}\n"
    str += "2. #{brew}\n"
    str += "3. #{pour_in_cup}\n"
    str += "4. #{add_condiments}\n"
  end

  def boil_water
    "Boil water"
  end

  def brew
    raise :MethodNotImplemented
  end

  def pour_in_cup
    "Pour into cup"
  end

  def add_condiments
    raise :MethodNotImplemented
  end

end
