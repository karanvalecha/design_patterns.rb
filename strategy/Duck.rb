require 'colorize'
require './DuckProperties.rb'

class Duck
  include DuckProperties

  attr_accessor :fly_behaviour, :quack_behaviour

  def initialize args=""
    puts "I am a generic Duck"
  end

  def quack
    @quack_behaviour || create_error("#{__method__}")
  end

  def fly
    @fly_behaviour || create_error("#{__method__}")
  end

  def setFly(type)
    @fly_behaviour = self.class.const_get("FlyBehaviour::#{type}").new if FlyBehaviour.constants.include?(type)
  end

  def setQuack(type)
    @quack_behaviour = self.class.const_get("QuackBehaviour::#{type}").new if QuackBehaviour.constants.include?(type)
  end

private
  def create_error(method)
    raise NoMethodError,
    "Did you set the '#{method}' property for '#{self.class}' class?".red
  end
end
