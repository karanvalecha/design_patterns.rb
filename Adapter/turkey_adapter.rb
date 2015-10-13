require './turkey.rb'

class TurkeyAdapter

  def initialize(turkey)
    @adaptee = turkey
  end

  def quack
    @adaptee.gobble
  end

  def fly
    str = ""
    5.times do
      str << @adaptee.fly
    end
    str
  end

end
