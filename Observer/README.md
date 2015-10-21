# *_Scenario_*
### You are assigned a task to work for a Weather Station :cloud: :sunny: :zap: :snowflake: :cyclone:

##### You will be provided with a `WeatherData` object which expAoses:

 * Temperature
 * Humidity
 * Pressure

##### Your job is to develop and provide some `elements` like:

* Current Conditions
* Weather Statistics
* Weather Forecasts
* ...

#### The above elements must be synchronized with `WeatherData` Object in RealTime :hourglass:

---

> Given Code for Weather Data

```ruby
class WeatherData
  def set_measurements(temp, hum, press)
    @temperature = temp
    @humidity = hum
    @pressure = press
  end
end
```
properties are updated by calling `#set_measurements` method.

## Analysis
We can do something quick like:

```ruby
class WeatherData

  def initialize
    #store elements
    @current_conditions = CurrentConditions.new
    @weather_statistics = WeatherStatistics.new
    @weather_forecasts = WeatherForecasts.new 
    ...
  end
  
  def set_measurements(temp, hum, press)
    @temperature = temp
    @humidity = hum
    @pressure = press
    update_elements() # call the update_elements method
  end
    
  def update_elements
    #update elements
    @current_conditions.update (@temperature, @humidity, @pressure)
    @weather_statistics.update (@temperature, @humidity, @pressure)
    @weather_forecasts.update (@temperature, @humidity, @pressure)
    ...
  end
end
```
```ruby
class CurrentConditions
  ...
  def update(temp, hum, press)
    @temperature = temp
    @humidity = hum
    @pressure = press
  end
end
```
```ruby
class WeatherStatistics
  ...
  def update(temp, hum, press)
    @temperature = temp
    @humidity = hum
    @pressure = press
  end
end
```
```ruby
class WeatherForecasts
  ...
  def update(temp, hum, press)
    @temperature = temp
    @humidity = hum
    @pressure = press
  end
end
```
#### :v: main problems
* `WeatherData` is not future-proof.
* Everything is ___messy___

---

#### What we need now:
* A way to keep the `WeatherData` untouched.
* Every `Element` must know how to update itself.
* :thought_balloon: :thought_balloon::thought_balloon:

---

## We have a pattern for that: [Observer](https://en.wikipedia.org/wiki/Observer_pattern)
![Observer](https://upload.wikimedia.org/wikipedia/commons/8/8d/Observer.svg)


#### Unofficial Definition:
> The observer pattern (sometimes known as publish/subscribe) is a software design pattern in which an object, called the subject, maintains a list of its dependents, called observers, and notifies them automatically of any state changes, usually by calling one of their methods.

### In our case:
`Elements` will be _subscribers_ for the `WeatherData` _publisher_.

> OR

`Elements` will be the _observers_ and `WeatherData` will be their *Subject* which will implement the _Observable_ properties and behavior.

## First things :one: st

###### `WeatherData` must be a single object and shared among the `Elements`, So we have to make it a *Singleton* object.
> We will use *Ruby*'s inbuilt library :gem: called `singleton` for applying the singleton behavior -

In case you don't know about it, here is the link before you proceed - [Implementing the Singleton Pattern in Ruby.]()

```ruby
require 'singleton'

class WeatherData
  include Singleton
  ...
end
```
Use `instance` instead of `new`
```ruby
@weather_data = WeatherData.instance
```

###### According to the _observer_ library in Ruby,

* Publisher must _include_ `Observable` module.
* Subscribers must _include_ `Observer` module. 

1. Subject/Publisher will receive the following methods from `Observable`

    * changed (To declare that value of the properties are _changed_)
    * notify_observers (will notify the observer with values passed as arguments)
    * add_observer (accepts objects and adds them to the subscriber's list)

2. Observers/Subscribers must implement the following method from `Observer`

    * update (this method will receive new values from the publisher, after publisher calls `#notify_observers` and `#changed` is set to `True`)

## Let's implement the pattern

![ observer singleton ](http://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2013/01/obsing-300x150.png)

```ruby
# weather_data.rb
require 'observer'
require 'singleton'

class WeatherData

  include Observable

  def set_measurements(temp, hum, press)    
    changed(true) if(temp == @temperature || hum == @humidity || press == @pressure)
    
    @temperature = temp; @humidity = hum; @pressure = press
     
    notify_observers(@temprature, @humidity, @pressure)
  end
  
end
```
###### :point_up:We have made `WeatherData` an observable, marked as `changed` and notified the observers for every call to `#set_measurements`.
```ruby
# element.rb
require 'observer'
require './weather_data'

class Element
  include Observer
  
  def initialize
    WeatherData.instance.add_observer(self) #add self as the observer
  end
end

```
###### :point_up: A SuperClass for below elements and add the current object in the `observers` list by calling *add_observer(self)* of the subject.

###### Elements implementing their respective *#update* method :point_down:
```ruby
#elements.rb
# The `#update` will only work if publisher is marked as changed

require './element'

class CurrentConditions < Element
  
  def update(temp, hum, press)
    # call the appropriate methods
  end
end

class WeatherStatistics < Element
  
  def update(temp, hum, press)
    # call the appropriate methods
  end
end

class WeatherForecasts < Element
  
  def update(temp, hum, press)
    # call the appropriate methods
  end
end
```

Check the Test Suite to understand more...

![ image ](http://image.slidesharecdn.com/designpatternsjoomla-100603035605-phpapp01/95/design-patterns-illustrated-40-1024.jpg?cb=1275584513)