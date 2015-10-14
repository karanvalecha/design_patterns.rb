require './Duck.rb'
require './DuckProperties.rb'

class MallardDuck < Duck
  include FlyBehaviour::WithWings
  include QuackBehaviour::Quack

  def to_s
    "Mallard"
  end
end

class RubberDuck < Duck
  include FlyBehaviour::NoFly
  include QuackBehaviour::Squeeze

  def to_s
    "Rubber"
  end
end

class RoboDuck < Duck
  include FlyBehaviour::WithRocket
  include QuackBehaviour::Silence

  def to_s
    "Robot"
  end
end
