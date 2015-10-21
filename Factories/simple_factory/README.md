# Scenario

You are involved in making an Pizza Ordering application

You see such code is in use:

```ruby
class PizzaStore
  ...
  def order(type)
    @pizza = nil
    if(type == 'cheese')
      @pizza = CheezePizza.new
    elsif(type == 'veggie')
      @pizza =  VeggiePizza.new
    end
    @pizza.prepare()
    @pizza.bake()
    @pizza.cut()
    @pizza.box
    return @pizza
  end
  
end
```

The Problem:
---
![simple factory](https://cloud.githubusercontent.com/assets/10561168/10618391/46e80648-778d-11e5-9583-e00a35b2e15a.PNG)

## [Factory](https://en.wikipedia.org/wiki/Factory_(object-oriented_programming)) to the rescue:

> ![](https://upload.wikimedia.org/wikipedia/commons/e/ee/Factory_Method_pattern_in_LePUS3.png)In object-oriented programming (OOP), a factory is an object for creating other objects – formally a factory is simply an object that returns an object from some method call, which is assumed to be "new".[a] More broadly, a subroutine that returns a "new" object may be referred to as a "factory", as in factory method or factory function.

How?
---
![simple factory solutionn](https://cloud.githubusercontent.com/assets/10561168/10618770/71b4fd8e-778f-11e5-9c0e-b2d03d1b083a.PNG)

like this

```ruby
class SimpleFactory
  def createPizza(type)
    pizza = nil
    if(type == 'cheese')
      @pizza = CheezePizza.new
    elsif(type == 'veggie')
      @pizza =  VeggiePizza.new
    end
    return pizza
  end
end
class PizzaStore
  ...
  def order(type)
    pizzaFactory = SimpleFactory.new
    @pizza = pizzaFactory.createPizza("")
    @pizza.prepare()
    @pizza.bake()
    @pizza.cut()
    @pizza.box
    return @pizza
  end
  
end
```
## The Benefits
One thing to remember is that the SimplePizzaFactory may have many clients. We've only seen the orderPizza() method; however, there may be a PizzaShopMenu class that uses the factory to get pizzas for their current description and price. We might also have a HomeDelivery class that handles pizzas in a different way than our PizzaShop class but is also a client of the factory.

So, by encapsulating the pizza creating in one class, we now have only one place to make modifications when the implementation changes.

Don't forget, we are also just about to remove the concrete instantiations from our client code!

---
# Factory Method Pattern


The simple factory "pattern" has some problems: each time we add a new concrete product, the factory class needs to be updated. In other words, the factory entity's behavior cannot be extended without modifying its source code. This violates the open/closed principle.

The factory method pattern partially solves this by allowing the factory to be "extended" via a factory method. There is no factory class. The creator (or client) provides a factory method which subclasses of the client override. In this way, the factory method lets the subclasses decide which class to instantiate.

![ image ](http://image.slidesharecdn.com/designpatternsjoomla-100603035605-phpapp01/95/design-patterns-illustrated-15-728.jpg?cb=1275584513)

Don't forget to checkout the Test Suite.