# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

require_relative 'graphic_ui'
require_relative 'human_player'
require_relative 'ai_player'
require_relative 'mastermind_calc'

# Contains game logic for Mastermind game.
class Game
  UI = GraphicUI

  def initialize
    @tries = 10
    @code_length = 4
    @valid_values = %w[1 2 3 4 5 6]
    @code = []
    @code_maker = nil
    @code_breaker = nil
  end

  def start
    game_loop
  end

  private

  def game_loop
    loop do
      set_players
      @code = @code_maker.generate_code
      guessing_loop
      break if UI.exit?
    end
  end

  def set_players
    @code_maker = UI.human?('Codemaker') ? HumanPlayer.new(@valid_values, @code_length) : AIPlayer.new(@valid_values, @code_length)
    @code_breaker = UI.human?('Codebreaker') ? HumanPlayer.new(@valid_values, @code_length) : AIPlayer.new(@valid_values, @code_length)
  end

  def guessing_loop
    @tries.times do |i|
      guess = @code_breaker.guess_code
      hits = MastermindCalc.match_hits(@code, guess)
      @code_breaker.pass_feedback(guess, hits, @tries)
      if @code == guess
        UI.display_win(@tries - 1 - i)
        return nil
      end
    end
    UI.display_game_over(@code)
  end
end

Game.new.start
