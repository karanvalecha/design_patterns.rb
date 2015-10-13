class Projector
  attr_reader :dvd_player, :power, :mode

  def initialize(dvd_player)
    @dvd_player = dvd_player
    @power = :off
  end

  def on
    @power = :on
  end

  def off
    @power = :off
  end

  def tv
    @mode = :tv
  end

  def widescreen
    @mode = :widescreen
  end
end
