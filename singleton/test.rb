require 'test/unit'
require './chocolate_boiler'

class SingletonTest < Test::Unit::TestCase

  def test_singleton
    a = ChocolateBoiler.instance
    b = ChocolateBoiler.instance
    assert(a == b)
  end

  def test_new_is_private
    assert_raise NoMethodError do
      ChocolateBoiler.new
    end
  end

  def test_behaviour
    a = ChocolateBoiler.instance
    b = ChocolateBoiler.instance

    assert(b.empty?)
    a.fill
    assert(!b.empty?)

    assert(!a.boiled?)
    b.boil
    assert(a.boiled?)
  end
end
