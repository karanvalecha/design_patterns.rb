require './Duck.rb'
class MallardDuck < Duck
  def initialize(args='')
  end
end
m = MallardDuck.new
m.display
m.setFly(:WithRocket)
m.fly

m.setQuack(:Silence)
m.quack