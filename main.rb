# frozen_string_literal: true

# requiered files inside lib folder for app to run correctly
require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/judge'
require_relative 'lib/player'

# class that runs the game
class GameRunner
  def self.run
    mastermind = Game.new
    mastermind.start_game
  end
end

GameRunner.run
