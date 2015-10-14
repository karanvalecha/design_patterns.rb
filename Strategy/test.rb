require 'test/unit'

require './Ducks'

class DuckTypeTest < Test::Unit::TestCase
  def setup
    @mallard = MallardDuck.new
    @rubber = RubberDuck.new
    @robot = RoboDuck.new
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
      assert_equal duck.swim, "#{duck.class} is swimming!"
    end
  end
  def test_type
    [@mallard, @rubber, @robot].each do |duck|
      assert_equal duck.type, "Type of #{duck.class}"
    end
  end
end
