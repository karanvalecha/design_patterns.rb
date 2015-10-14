require 'observer'

class WeatherData
  include Observable

  attr_reader :temperature, :humidity, :pressure

  def measurements_changed
    changed
    notify_observers(@temperature, @humidity, @pressure)
  end

  def set_measurements(temp, hum, press)
    @temperature=temp
    @humidity=hum
    @pressure=press
    measurements_changed
  end
end
