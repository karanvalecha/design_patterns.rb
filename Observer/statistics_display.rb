require './observer'

class StatisticsDisplay
  include Observer

  attr_accessor :temp_history, :humd_history, :pressure_history
  attr_accessor :temp_avg, :humd_avg, :pressure_avg

  def initialize
    @temp_history = Array.new
    @humd_history = Array.new
    @pressure_history = Array.new

    @temp_avg = 0
    @humd_avg = 0
    @pressure_avg = 0
  end

  def update(temp, humd, press)
    @temp_history << temp
    @humd_history << humd
    @pressure_history << press

    @temp_avg = @temp_history.reduce(0, :+) / @temp_history.length
    @humd_avg = @humd_history.reduce(0, :+) / @humd_history.length
    @pressure_avg = @pressure_history.reduce(0, :+) / @pressure_history.length
  end

  def to_s
    "Avg/Max/Min temperature: #{@temp_avg}/#{@temp_history.max}/#{@temp_history.min}"
  end

end
