require 'test/unit'

require './duck.rb'
require './turkey.rb'
require './turkey_adapter.rb'

class AdapterTest < Test::Unit::TestCase

  def test_duck_quack
    mallard = Duck.new
    assert_equal "Quack!", mallard.quack
  end

  def test_duck_fly
    mallard = Duck.new
    assert_equal "I'm flying", mallard.fly
  end

  def test_turkey_gobble
    wild_turkey = Turkey.new
    assert_equal "Gobble gobble!", wild_turkey.gobble
  end

  def test_turkey_fly
    wild_turkey = Turkey.new
    assert_equal "I'm flying a short distance", wild_turkey.fly
  end

  def test_adapter_quack
    wild_turkey = Turkey.new
    not_a_duck = TurkeyAdapter.new(wild_turkey);
    assert_equal "Gobble gobble!", not_a_duck.quack
  end

  def test_adapter_fly
    wild_turkey = Turkey.new
    not_a_duck = TurkeyAdapter.new(wild_turkey);
    assert_equal("I'm flying a short distance"*5, not_a_duck.fly)
  end

end
