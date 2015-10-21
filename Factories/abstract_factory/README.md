# Scenario

After the Simple Factory, the Pizza store has grown and have two special versions: `NYPizza` and `ChicagoPizza`

A pizza has to have some ingredients:

* `Dough`
* `Sauce`
* `Cheese`
* `Pepperoni`
* `Clams`

### NYPizza Ingredients
```ruby
Dough: ThinCrust
Sauce: Marinara
Cheese: Reggiano
Pepperoni: Slided
Clams: Fresh
```
### ChicagoPizza Ingredients
```ruby
Dough: ThickCrust
Sauce: PlumTomato
Cheese: Mozzarella
Pepperoni: Slided
Clams: Frozen
```

## Abstract Factory:
> The abstract factory pattern is a design pattern that allows for the creation of groups of related objects without the requirement of specifying the exact concrete classes that will be used. One of a number of factory classes generates the object sets.

We will return the Ingredients Object and Methods via a Factory.

This is continuation of SimpleFactory, Check the code and Test Suite to Learn More ...

![ Image ](http://image.slidesharecdn.com/designpatternsjoomla-100603035605-phpapp01/95/design-patterns-illustrated-16-728.jpg?cb=1275584513)