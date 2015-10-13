class Amplifier

  attr_accessor :tuner, :cd_player, :dvd_player, :volume
  attr_reader :power, :sound

  def initialize
    @power = :off
    @sound = :stereo
  end

  def on
    @power = :on
  end

  def off
    @power = :off
  end

  def set_stereo_sound
    @sound = :stereo
  end

  def set_surround_sound
    @sound = :surround
  end

end
