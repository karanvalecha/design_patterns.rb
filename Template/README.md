# Scenario

You were managing an application for creating Tea and Coffee from a Machine

Instructions:

### Coffee
1. Boil some water
2. Brew coffee in boiling water
3. Pour coffee in cup
4. Add sugar and milk

### Tea
1. Boil some water
2. Steep tea in boiling water
3. Pour tea in cup
4. Add lemon


```Ruby
class Coffee

  def prepare
    boil_water
    brew_coffee_grinds
    pour_in_cup
    add_sugar_and_milk
  end

  def boil_water
    # boil water
  end

  def brew_coffee_grinds
    # do something
  end

...

end

class Tea

  def prepare
    boil_water
    steep_tea
    pour_in_cup
    add_lemon
  end

  def boil_water
    # boil water
  end

  def steep_tea
    # do something
  end
...
end
```

## How to avoid Duplication?
Template Pattern:

> The template method pattern is a design pattern that allows a group of interchangeable, similarly structured, multi-step algorithms to be defined. Each algorithm follows the same series of actions but provides a different implementation of the steps.

![ image ](http://img.my.csdn.net/uploads/201304/17/1366189500_5930.png)

SuperClass
```ruby
class CaffeineBeverage

  def prepare
    string = "Starting:\n"
    string += "1. #{boil_water}\n"
    string += "2. #{ brew }\n"
    string += "3. #{pour_in_cup}\n"
    string += "4. #{add_condiments}\n"
    return string
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
```

Subclasses:
```ruby
class Coffee < CaffeineBeverage

  def brew
    "Drip coffee through filter"
  end

  def add_condiments
    "Add sugar and milk"
  end

end

class Tea < CaffeineBeverage

  def brew
    "Steep tea in boiled water"
  end

  def add_condiments
    "Add lemon"
  end

end
```
![ Image ](http://image.slidesharecdn.com/designpatternsjoomla-100603035605-phpapp01/95/design-patterns-illustrated-45-728.jpg?cb=1275584513)