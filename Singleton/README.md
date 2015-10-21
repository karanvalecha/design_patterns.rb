# _Scenario_
You are assigned a task to create software for a `Chocolate Boiler` Machine.

Your task is to accept `milk` and `chocolate`, __boil__ them then forward to other process.

> You may think it as a Pretty Simple task :smirk:

### Let's See
###### A very basic implementation for a `Chocolate Boiler` :point_down:
```ruby
class ChocolateBoiler
  def initialize
    @empty = true
    @boiled = false
  end
  
  def fill
    if empty?
      @empty = false
      @boiled = false
      # fill the boiler with milk/chocolate
      puts "filling"
      puts "filled"
    else
      puts "Already Filled"
    end
  end

  def drain
    if (!empty? and !boiled?)
      # drain the boiler and bring to default state
      @empty = true
      @boiled = false
      puts "draining"
      puts "drained"
    else
      puts "Already Empty"
    end
  end

  def boil
    if (!empty? and !boiled?)
      # bring contents to a boil
      @boiled = true
      puts "boiling"
      puts "boiled"
    else
      puts "Already Boiled"
    end
  end

  def empty?
    @empty
  end

  def boiled?
    @boiled
  end
end
```

> `>>` is User's Input, `=>` is Program's Output :point_down:

```ruby
>> ProcessA = ChocolateBoiler.new
=> #<:ChocollateBoiler:0x8fb23c4, @empty = true, @boiled = false>
>> ProcessA.fill
=> filling
=> filled
>> ProcessA.boil
=> boiling
=> boiled
>> ProcessA.drain
=> draining
=> drained
```

### Looks fine, but here is the result when used concurrently

```ruby
>> ProcessA = ChocolateBoiler.new
=> #<:ChocollateBoiler:0x8fb23c4, @empty = true, @boiled = false>
>> ProcessB = ChocolateBoiler.new
=> #<:ChocollateBoiler:0x8fc32c8, @empty = true, @boiled = false>
>> ProcessA.fill
=> filling
=> filled
>> ProcessB.fill
=> filling
=> filled
```
## The Problem:
#### :x: Boiler is accepting more input even when filled :x:
> In fact they are two different `ChocolateBoiler`s :confused:

```ruby
>> ProcessA == ProcessB
=> False
>> ProcessA.object_id == ProcessB.object_id
=> False
>> A.oject_id
=> 75346810
>> B.object_id
=> 75964584
```
### Mission :rocket:
*To share and receive a `single object` from a `single class` across the whole application.*

## Analysis :mag:
* The `#new` method instantiates and returns a new object.
* In Ruby `#new` is a class method i.e. It is called by `ClassName.new`.
* It is also responsible for calling the `constructor` of class, which constructs a new `Object`.

>We need a workaround for the :new: method

## [Singleton Pattern]() to the rescue :lock: :one: :lock:
![ Singleton ](http://www.javaskool.com/codeResources/JavaDesignPatternChapters/corejavapatternPics/singleton2.png)
:point_left:__The singleton pattern is a design pattern that is used to ensure that a class can only have one concurrent instance. Whenever additional objects of a singleton class are required, the previously created, single instance is provided.__

### What we need to do:

1. We need to disallow access to the `#new` class method directly.
2. We need to Implement our own method which can call the `#new`.
3. We need to make sure that `#new` is called only once in the application's lifetime.

### How do we do it:
1. Make the `#new` method private, so it is only accessible to the `methods` inside the class.
  * We can use `private_class_method` method to declare any class-method private.
  ```ruby
    class ChocolateBoiler
      private_class_method :new
    end
  ```
2. Make a `public class-method` that calls `#new` for only once in it's lifetime, stores and returns that only object.
3. We will be using [`||= (click to know more)`](http://www.rubyinside.com/what-rubys-double-pipe-or-equals-really-does-5488.html)
    ```ruby
    class ChocolateBoiler
      private_class_method :new
      
      def ChocolateBoiler.instance # a class-method named instance
        @instance ||= self.class.new # @instance ||= ChocolateBoiler.new
      end
    end
    ```
4. Done. Use `#instance` instead of `#new`
 
```ruby
>> ChocolateBoiler.new
=> NoMethodError: private method 'new' called for ChocolateBoiler
>> ProcessA = ChocolateBoiler.instance
=> #<:ChocollateBoiler:0x8fb23c4, @empty = true, @boiled = false>
>> ProcessB = ChocolateBoiler.instance
=> #<:ChocollateBoiler:0x8fb23c4, @empty = true, @boiled = false>
>> ProcessA == ProcessB
=> True
```
Check the *test suite* to know more.

![ image ](http://image.slidesharecdn.com/designpatternsjoomla-100603035605-phpapp01/95/design-patterns-illustrated-18-1024.jpg?cb=1275584513)