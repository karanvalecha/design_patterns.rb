# _Scenario_
Suppose You are assigned a task to create virtual ___Duck___ prototypes that will be injected in a ___Duck Simulator___ object.

![ simulator duck ](http://i.ytimg.com/vi/dZqeBwGE_RQ/hqdefault.jpg)

These ___Duck___ objects can differ in Fly/Quack Behaviors.

:three: of some :100: sample prototypes including their behaviors:

1. Mallard
  * Flies with the *Wings*
  * Sounds "Quack Quack"
2. Rubber
  * Does not *Fly*
  * Sounds *Squeeze*
3. Robot
  * Flies with *a Rocket*
  * Sounds **No Sound**

## Current Code: :x:Inheritence:x:
```ruby
# SuperClass for Duck Objects
class Duck
  def fly
    # Some code..
  end
  def quack
    # Some code..
  end
end
```
```ruby
# Subclass Implementation
class Mallard < Duck
  # Override Fly and Quack methods
end
class Rubber < Duck
  # Override Fly and Quack methods
end
class Robot < Duck
  # Override Fly and Quack methods
end
```
#### Some problems with the :arrow_double_up: above :arrow_double_up: code are:
  * It is tedious and difficult to maintain
  * The flow is not [*DRY*](https://www.google.co.in/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0CBwQFjAAahUKEwjk_-TbisTIAhVQTI4KHeHPDs8&url=http%3A%2F%2Fblog.41studio.com%2Fdont-repeat-yourself-dry-in-ruby-on-rails%2F&usg=AFQjCNFCpPkLXxrEB2fVv8UfCzXFndSKdQ&bvm=bv.105039540,d.c2E)
  * Gets out of the hand very quickly

## What is a [Strategy Pattern]()
###### Unofficial Definition:
> The strategy pattern is a design pattern that allows a set of similar algorithms to be defined and encapsulated in their own classes.The algorithm to be used for a particular purpose may then be selected at run-time according to your requirements.

###### In Layman's term
* Prefer Composition over Inheritance by moving the code into `Modules`.
* Inject the appropriate `Module` at runtime.

## How does it look like? :eyes:
![ image ](http://best-practice-software-engineering.ifs.tuwien.ac.at/patterns/images/strategy_simple.jpg) :point_left: Code flow of a Strategy Pattern.

This allows the behavior of a program to change dynamically according to configuration details or user preferences. It also increases flexibility by allowing new algorithms to be easily incorporated in the future.

## How do we implement it?
#### Modularizing and grouping the behaviors
> FlyBehaviour Module

```ruby
module FlyBehaviour
  ...
  module NoFly
    def fly
      ...
    end
  end

  module WithWings
    def fly
      ...
    end
  end

  module WithRocket
    def fly
      ...
    end
  end
  ...
end
```
> QuackBehavior Module

```ruby
module QuackBehaviour
  ...
  module Quack
    def quack
      ...
    end
  end

  module Squeeze
    def quack
      ...
    end
  end

  module Silence
    def quack
      ...
    end
  end
  ...
end
```
> Update the Base class

```ruby
class Duck
...
  def fly
    raise NotImplementedError
  end
  def quack
    raise NotImplementedError
  end
...
end
```
> Use ruby's `extend` method to inject `Module` at runtime

```ruby
@mallard = Duck.new("Mallard Duck").extend(FlyBehaviour::WithWings, QuackBehaviour::Quack)
```
## And we are done with executing logics at runtime.

Checkout the `test.rb` to know about the code flow.
![ image ](http://image.slidesharecdn.com/designpatternsjoomla-100603035605-phpapp01/95/design-patterns-illustrated-43-1024.jpg?cb=1275584513)