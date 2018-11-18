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
    @code = [1, 2, 3, 2]
    @code_maker = nil
    @code_breaker = nil
  end

  def start
    game_loop
  end

  # TODO: set private again after tests:
  # private

  def game_loop
    loop do
      set_players
      @code = @code_maker.generate_code
      guessing_loop

      break if UI.exit?
    end
  end

  def set_players
    @code_maker =
       if UI.human?('Codemaker')
         HumanPlayer.new(@valid_values, CODE_LENGTH)
       else
         AIPlayer.new(@valid_values, CODE_LENGTH)
       end
    @code_breaker =
       if UI.human?('Codebreaker')
         HumanPlayer.new(@valid_values, CODE_LENGTH)
       else
         AIPlayer.new(@valid_values, CODE_LENGTH)
       end
  end

  def guessing_loop
    TRIES.times do |i|
      guess = @code_breaker.guess_code
      hits = calculate_hits(guess)
      UI.display_feedback(hits[0], hits[1], TRIES - 1 - i)

      if @code == guess
        UI.display_win
        return nil
      end
    end
    UI.display_game_over
  end

  def calculate_hits(guessed_code)
    hits = Array.new(CODE_LENGTH)
    guessed_code.each_index { |i| hits[i] = 'b' if @code[i] == guessed_code[i] }

    # calculate black and white hits here
    # return [black, white]
  end
end

Game.new.start
