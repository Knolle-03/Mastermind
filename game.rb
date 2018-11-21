# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

require_relative 'ui'
require_relative 'human_player'
require_relative 'ai_player'

# Contains game logic for Mastermind game.
class Game
  def initialize
    @tries = 10
    @code_length = 4
    @valid_values = %w[1 2 3 4 5 6].freeze
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
    @code_maker = UI.human?('Codemaker') ? HumanPlayer.new(@valid_values, @code_length) : AIPlayer.new(@valid_values, @code_length)
    @code_breaker = UI.human?('Codebreaker') ? HumanPlayer.new(@valid_values, @code_length) : AIPlayer.new(@valid_values, @code_length)
  end

  def guessing_loop
    UI.display_help_text(@valid_values, @code_length)
    @tries.times do |i|
      guess = @code_breaker.guess_code
      loop do
        if guess.length <= 2
        UI.display_clue(guess)
        guess = @code_breaker.guess_code
        end
        break if guess.length == 4
      end
      hits = calculate_hits(guess)
      if @code == guess
        UI.display_win(@tries - 1 - i)
        return nil
      end
      @code_breaker.pass_feedback(guess, hits) #if @code_breaker.is_a?(AIPlayer)
      UI.display_feedback(hits[0], hits[1], @tries - 1 - i)
    end
    UI.display_game_over(@code)
  end

  def calculate_hits(guess)
    unused = @code.dup
    guess.each_index { |i| unused[i] = false if @code[i] == guess[i] }
    blacks = unused.count(false)

    whites = 0
    guess.each_index do |i|
      next unless unused[i]
        if unused.include?(guess[i])
          unused[unused.index(guess[i])] = 0
          whites += 1
        end
    end
    [blacks, whites]
  end
end

Game.new.start
