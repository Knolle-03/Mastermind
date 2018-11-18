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
      # TODO: remove explicit code display:
      #puts "(code: #{@code.join(',')})"
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
    UI.display_help_text(@valid_values, CODE_LENGTH)
    TRIES.times do |i|
      guess = @code_breaker.guess_code
      hits = calculate_hits(guess)
      if @code == guess
        UI.display_win(TRIES - 1 - i)
        return nil
      end
      UI.display_feedback(hits[0], hits[1], TRIES - 1 - i)
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

  # def calculate_hits(guess)
  #   hits = []
  #   black = black_hits(guess)
  #   white = white_hits(guess)
  #   hits << black << (white - black)
  #   hits
  # end

  # def black_hits(guess)
  #   black_hits = 0
  #   nested_arrays = @code.zip(guess)
  #   nested_arrays.each do |array|
  #     array[0] == array[1] ? black_hits += 1 : nil
  #   end
  #   black_hits
  # end
  #
  # def white_hits(guess)
  #   white_hits = 0
  #   guess.each do |sym|
  #     @code.include?(sym) ? white_hits += 1 : nil
  #   end
  #   white_hits
  # end
end

Game.new.start
