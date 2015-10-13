require 'test/unit'
require './beverages.rb'
require './condiments.rb'

include Beverage

class DecoratorTest < Test::Unit::TestCase
  include Condiment

  def setup
    @house_blend = HouseBlend.new
    @dark_roast = DarkRoast.new
    @decaf = Decaf.new
    @espresso = Espresso.new
  end

  def test_check_default_costs
    assert_equal(@house_blend.cost, 0.89) 
    assert_equal(@dark_roast.cost, 0.99)
    assert_equal(@decaf.cost, 1.05)
    assert_equal(@espresso.cost, 1.99)
  end
  def test_with_condiments
    assert_equal(@house_blend.extend(SteamedMilk).cost, 0.89 + 0.10)
    assert_equal(@dark_roast.extend(SoyMilk).cost, 0.99 + 0.15)
    assert_equal(@decaf.extend(Mocha).cost, 1.05 + 0.20)
    # Multiple Extends
    assert_equal(@espresso.extend(WhipCream, Mocha).cost, 1.99+0.10+0.20)
  end
end
