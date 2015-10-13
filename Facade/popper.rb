class Popper
  attr_reader :power

  def initialize
    @power = :off
  end

  def on
    @power = :on
  end

  def off
    @power = :off
  end

  def pop
    puts "Popping!"
  end
end
