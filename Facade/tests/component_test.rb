require 'test/unit'

require_relative '../amplifier.rb'
require_relative '../tuner.rb'
require_relative '../screen.rb'
require_relative '../popper.rb'
require_relative '../cd_player.rb'
require_relative '../dvd_player.rb'
require_relative '../projector.rb'
require_relative '../lights.rb'

class ComponentTest < Test::Unit::TestCase

  def test_amo_init
    amp = Amplifier.new
    assert_equal :off, amp.power
    assert_equal :stereo, amp.sound
  end

  def test_amp_on
    amp = Amplifier.new
    amp.on

    assert_equal :on, amp.power
  end

  def test_amp_off
    amp = Amplifier.new
    amp.on
    amp.off

    assert_equal :off, amp.power
  end

  def test_amp_stereo
    amp = Amplifier.new
    amp.set_stereo_sound

    assert_equal :stereo, amp.sound
  end

  def test_amp_surround
    amp = Amplifier.new
    amp.set_surround_sound

    assert_equal :surround, amp.sound
  end

  def test_tuner_init
    tuner = Tuner.new
    assert_equal :off, tuner.power
  end

  def test_tuner_on
    tuner = Tuner.new
    tuner.on
    assert_equal :on, tuner.on
  end

  def test_tuner_off
    tuner = Tuner.new
    tuner.on
    tuner.off
    assert_equal :off, tuner.power
  end

  def test_tuner_set_am
    tuner = Tuner.new
    tuner.set_am
    assert_equal :am, tuner.band
  end

  def test_tuner_set_fm
    tuner = Tuner.new
    tuner.set_fm
    assert_equal :fm, tuner.band
  end

  def test_screen_init
    screen = Screen.new
    assert_equal :up, screen.position
  end

  def test_screen_up
    screen = Screen.new
    screen.down
    screen.up
    assert_equal :up, screen.position
  end

  def test_screen_down
    screen = Screen.new
    screen.down
    assert_equal :down, screen.position
  end

  def test_popper_init
    popper = Popper.new
    assert_equal :off, popper.power
  end

  def test_popper_on
    popper = Popper.new
    popper.on
    assert_equal :on, popper.power
  end

  def test_popper_off
    popper = Popper.new
    popper.on
    popper.off
    assert_equal :off, popper.power
  end

  def test_cd_player_init
    cd = CdPlayer.new
    assert_equal :off, cd.power
  end

  def test_cd_player_on
    cd = CdPlayer.new
    cd.on
    assert_equal :on, cd.power
  end

  def test_cd_player_off
    cd = CdPlayer.new
    cd.on
    cd.off
    assert_equal :off, cd.power
  end

  def test_dvd_player_init
    amp = Amplifier.new
    dvd = DvdPlayer.new(amp)
    assert_equal :off, dvd.power
    assert_nil dvd.currently_playing
    assert_equal amp, dvd.amp
  end

  def test_dvd_player_on
    amp = Amplifier.new
    dvd = DvdPlayer.new(amp)
    dvd.on
    assert_equal :on, dvd.power
  end

  def test_dvd_player_off
    amp = Amplifier.new
    dvd = DvdPlayer.new(amp)
    dvd.on
    dvd.off
    assert_equal :off, dvd.power
    assert_nil dvd.currently_playing
  end

  def test_dvd_player_play
    amp = Amplifier.new
    dvd = DvdPlayer.new(amp)
    dvd.on
    dvd.play("BSG")
    assert_equal "BSG", dvd.currently_playing
  end

  def test_dvd_player_surround_sound
    amp = Amplifier.new
    dvd = DvdPlayer.new(amp)
    dvd.surround
    assert_equal :surround, dvd.amp.sound
  end

  def test_dvd_player_stereo_sound
    amp = Amplifier.new
    dvd = DvdPlayer.new(amp)
    dvd.stereo
    assert_equal :stereo, dvd.amp.sound
  end

  def test_projector_init
    amp = Amplifier.new
    dvd = DvdPlayer.new(amp)
    proj = Projector.new(dvd)
    assert_equal dvd, proj.dvd_player
    assert_equal :off, proj.power
  end

  def test_projector_on
    amp = Amplifier.new
    dvd = DvdPlayer.new(amp)
    proj = Projector.new(dvd)
    proj.on
    assert_equal :on, proj.power
  end

  def test_projector_off
    amp = Amplifier.new
    dvd = DvdPlayer.new(amp)
    proj = Projector.new(dvd)
    proj.on
    proj.off
    assert_equal :off, proj.power
  end

  def test_projector_mode_widescreen
    amp = Amplifier.new
    dvd = DvdPlayer.new(amp)
    proj = Projector.new(dvd)
    proj.on
    proj.widescreen
    assert_equal :widescreen, proj.mode
  end

  def test_projector_mode_tv
    amp = Amplifier.new
    dvd = DvdPlayer.new(amp)
    proj = Projector.new(dvd)
    proj.on
    proj.tv
    assert_equal :tv, proj.mode
  end

  def test_lights_init
    lights = Lights.new
    assert_equal :off, lights.power
  end

  def test_lights_on
    lights = Lights.new
    lights.on
    assert_equal :on, lights.power
  end

  def test_lights_off
    lights = Lights.new
    lights.on
    lights.off
    assert_equal :off, lights.power
  end

  def test_lights_dim
    lights = Lights.new
    lights.dim
    assert_equal :dim, lights.power
  end
end
