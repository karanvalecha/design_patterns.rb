# Scenario

You are now working for a cafeteria, making an application that can make order for beverages.

You have to implement the following beverages with given cost

* House Blend $0.89
* Dark Roast $0.99
* Decaf $1.05
* Espresso $1.99

Clients can add some condiments like

* Steamed Milk $0.10
* Soy Milk $0.15
* Mocha $0.20
* Whip Cream $0.10

###### You have to mix the Beverage and the Condiment in such a way that cost of the Beverage is mutated with every mix of a Condiment.

Most Simple Approach:
```ruby
# Let's try a House Blend with Steamed Milk
class SteamedMilk
  def cost
    return 0.10
  end
end
class HouseBlend
  def cost
    @cost = 0.89
  end
  def add_steamed_milk
    @cost += SteamedMilk.cost
  end
end
```
irb
```ruby
# Implementing the above
@order = HouseBlend.new
@order.cost
-> 0.89
@order.add_steamed_milk
@order.cost
-> 0.99
```

:point_up: That's not maintainable for sure, If implemented with all Beverages and Condiments.

## How do we [Decorate]() effectively?
Decorator Pattern:
> The decorator pattern is a design pattern that extends the functionality of individual objects by wrapping them with one or more decorator classes. These decorators can modify existing members and add new methods and properties at run-time.

![ decorator Image ](https://shishirkumarblog.files.wordpress.com/2011/07/decorator_class_explosion1.jpg)

According to the above statement,

1. Decorators i.e. Condiments must be separated from the Main object i.e. Beverages .
2. Decorators must modify/extend Main object's functionality.
3. Decorators must be added to the Main object at runtime.

#### There are more than one ways to achieve the above.

In Ruby it is better to implement using:
> `Module` + `Super` + `Extend` approach.

1) The `Module` part - Separate from Beverage classes into their own modules.
```ruby
# Condiments
module SteamedMilk
  def cost
    ...
  end
end
module SoyMilk
  def cost
    ...
  end
end
module Mocha
  def cost
    ...
  end
end
module WhipCream
  def cost
    ...
  end
end
```
2) The `Super` method - super() will call the `#cost` method on the object.

```ruby
# Beverages
class HouseBlend
  def cost
    @cost = 0.89
  end
end
class DarkRoast
  def cost
    @cost = 0.99
  end
end
class Decaf
  def cost
    @cost = 1.05
  end
end
class Espresso
  def cost
    @cost = 1.99
  end
end
```
```ruby
# Condiments
module SteamedMilk
  def cost
    super() + 0.10
  end
end
module SoyMilk
  def cost
    super() + 0.15
  end
end
module Mocha
  def cost
    super() + 0.20
  end
end
module WhipCream
  def cost
    super() + 0.10
  end
end
```
3) Adding cost with `#Extend`.
```ruby
@order = Espresso.new() # Take a new order
@order.cost #-> 1.99 # cost
@order.extend(Mocha).extend(WhipCream) # Add Mocha with Whip Cream
@order.cost #-> 2.29 # 1.99 + 0.20 + 0.10
```

## A picture of what we did:

![](http://web.science.mq.edu.au/~mattr/courses/object_oriented_development_practices/5/in_action.png)

Make sure to check the Test suite to learn more.

![ image ](http://image.slidesharecdn.com/designpatternsjoomla-100603035605-phpapp01/95/design-patterns-illustrated-27-1024.jpg?cb=1275584513)