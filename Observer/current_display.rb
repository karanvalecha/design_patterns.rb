require './observer'

class CurrentDisplay
  include Observer

  attr_accessor :temperature, :humidity, :pressure

  def update(temp, humd, press)
    @temperature = temp
    @humidity = humd
    @pressure = press
  end

  def to_s
    'Current conditions: ' + @temperature.to_s + 'C degrees and ' + @humidity.to_s + '% humidity'
  end
end
