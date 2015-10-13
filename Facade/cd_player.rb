class CdPlayer
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

  def eject
  end

  def play
  end

  def pause
  end

  def stop
  end

end

