# Scenario
You have been creating a Duck Simulator which depicts Quacking and Flying of any Duck object assigned to it.

![duck simulator ](http://i.ytimg.com/vi/dZqeBwGE_RQ/hqdefault.jpg)

```ruby
#superclass
class Duck
  def fly
    raise NotImplementedError
  end
  def quack
    raise NotImplementedError
  end
end
```
```ruby
#some duck
class SomeDuck < Duck
  def fly
    20 # Number of feet
  end
  def quack
    "Quack Quack"
  end
end
```
###### Enters the manager :bomb:

> We need a Turkey added before today's launch. Make it ASAP:imp:

```ruby
# A turkey class
class SomeTurkey
  def short_fly
    "I fly 5 times shorter than a Duck"
  end
  def gobble
    "I gobble instead of Quack"
  end
end
```
> But this Turkey does not `Fly` and does not `Quack`.:sweat:
![ No adapter ](http://images.cnitblog.com/blog/325852/201305/04150931-f53abf9450bb47e7ba3bedca5059a9ed.png)

### How can this `Turkey` object fit inside a Duck Simulator if it does not implement `#fly` and `#quack`?
:confused:
---
### -> It needs an [Adapter](https://en.wikipedia.org/wiki/Adapter_pattern), seriously!

## Adapter Pattern

> The adapter pattern is a design pattern that is used to allow two incompatible types to communicate. Where one class relies upon a specific interface that is not implemented by another class, the adapter acts as a translator between the two types.

*We need an adapter which talks to the Duck Simulator like a Duck*
![ adapter ](http://images.cnitblog.com/blog/325852/201305/04150941-43839ca4fa9646c2807c1ce85910ba2c.png)

This pattern suggests to build an Interface for Incompatible class that can communicate to the Adaptee Interface.

The Interface
---
We will be using Ruby Modules to act as an Adapter Interface.

```ruby
# turkey to duck adapter
module TurkeyToDuckAdapter
  def fly #Implementing duck's fly
    fly = 0
    5.times{ fly += short_fly } # Add short_fly 5 times
    return fly
  end
  def quack # Implementing duck's quack
    return gobble #gobble instead of quacking
  end
end
```
Final Words
---
* Client: Turkey Class
* Adapter: TurkeyToDuckAdapter Module
* Adaptee: Duck Simulator

![Adapter Image ](http://www.frederikprijck.net/wp-content/uploads/2013/07/hf-adapter.jpg)

And we are done
```ruby
# A turkey class
class SomeTurkey
  include TurkeyToDuckAdapter
  
  def short_fly
    return 5 # 5 feet
  end
  def gobble
    return "Gobble Gobble"
  end
end
```

Check Tests to understand more..

![ image ](http://image.slidesharecdn.com/designpatternsjoomla-100603035605-phpapp01/95/design-patterns-illustrated-23-1024.jpg?cb=1275584513)