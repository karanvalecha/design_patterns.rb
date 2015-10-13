class DvdPlayer
  attr_reader :power, :amp, :currently_playing

  def initialize(amp)
    @amp = amp
    @power = :off
    @currently_playing = nil
  end

  def on
    @power = :on
  end

  def off
    @power = :off
    @currently_playing = nil
  end

  def stereo
    @amp.set_stereo_sound
  end

  def surround
    @amp.set_surround_sound
  end

  def play(movie)
    @currently_playing = movie
  end

  def pause
  end

  def eject
  end

  def stop
  end

end
