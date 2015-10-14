require './pizza.rb'

class ClamPizza < Pizza

  def initialize(factory)
    @factory = factory
  end

  def prepare
    super(@factory)
    @clam = @factory.create_clam
  end
end
