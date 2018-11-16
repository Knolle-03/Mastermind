# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

require_relative 'ui'
require_relative 'human_player'
require_relative 'ai_player'

# Contains game logic for Mastermind game.
class Game
  TRIES = 10
  CODE_LENGTH = 4
  DEFAULT_SYMBOLS = %w[1 2 3 4 5 6].freeze

  def initialize
    @valid_values = DEFAULT_SYMBOLS
    @code = nil
    @code_maker = nil
    @code_breaker = nil
  end

  # Starts the game loop
  def start
    get_players
    @code = @code_maker.generate_code(@valid_values, CODE_LENGTH)
    @code_maker.guess_code(@valid_values, CODE_LENGTH, @code)
  end

  # Assigns new Player objects to codemaker and -breaker.
  def get_players
    players = UI.get_players
    @code_maker = players[0].eql?('h') ? HumanPlayer.new : AIPlayer.new
    @code_breaker = players[1].eql?('h') ? HumanPlayer.new : AIPlayer.new
  end
end
