
require_relative './amplifier.rb'
require_relative './tuner.rb'
require_relative './screen.rb'
require_relative './popper.rb'
require_relative './cd_player.rb'
require_relative './dvd_player.rb'
require_relative './projector.rb'
require_relative './lights.rb'

class HomeTheatreFacade
  attr_reader :amp, :tuner, :screen, :popper, :cd_player, :dvd_player,
    :projector, :lights

  def initialize(params)
    @amp = params[:amp]
    @tuner = params[:tuner]
    @screen = params[:screen]
    @popper = params[:popper]
    @cd_player = params[:cd_player]
    @dvd_player = params[:dvd_player]
    @projector = params[:projector]
    @lights = params[:lights]
  end

  def watch_movie(movie)
    @popper.on
    @lights.dim
    @screen.down
    @projector.on
    @projector.widescreen
    @amp.on
    @amp.set_surround_sound
    @amp.volume = 5
    @dvd_player.on
    @dvd_player.play(movie)
  end

  def end_movie
    @popper.off
    @lights.on
    @screen.up
    @projector.off
    @amp.off
    @dvd_player.off
  end
end
