require 'test/unit'

require './Duck'

class DuckTypeTest < Test::Unit::TestCase

  def setup
    @mallard = Duck.new("Mallard Duck").extend(FlyBehaviour::WithWings, QuackBehaviour::Quack)
    @rubber = Duck.new("Rubber Duck").extend(FlyBehaviour::NoFly, QuackBehaviour::Squeeze)
    @robot = Duck.new("Robo Duck").extend(FlyBehaviour::WithRocket, QuackBehaviour::Silence)
  end

  def test_valid_ducks
    [@mallard, @rubber, @robot].each do |duck|
      assert duck.is_a? Duck
    end
  end

  def test_quack_behaviors
    assert_equal @mallard.quack, "Quack Quack!"
    assert_equal @rubber.quack, "I am Squeezed!"
    assert_equal @robot.quack, "Silence!"
  end

  def test_fly_behaviors
    assert_equal @mallard.fly, "Fly With Wings"
    assert_equal @rubber.fly, "No Fly"
    assert_equal @robot.fly, "Fly With Rocket"
  end

  def test_swim
    [@mallard, @rubber, @robot].each do |duck|
      assert_equal duck.swim, "'#{duck.name}' is swimming!"
    end
  end

  def test_invalid_duck
    invalid_duck = Duck.new
    #check name
    assert_raise(NotImplementedError.new("'name' is not set")){ invalid_duck.name }
    #check swim
    assert_raise(NotImplementedError.new("'name' is not set")){ invalid_duck.swim }
    #check fly
    assert_raise(NotImplementedError.new("'FlyBehaviour' is not defined")){ invalid_duck.fly }
    #check quack 
    assert_raise(NotImplementedError.new("'QuackBehaviour' is not defined")){ invalid_duck.quack }
  end

end
