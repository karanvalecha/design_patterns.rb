class Lights
  attr_reader :power

  def initialize
    @power = :off
  end

  def dim
    @power = :dim
  end

  def on
    @power = :on
  end

  def off
    @power = :off
  end
end
