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

  # Starts the game loop
  def start
    game_loop
  end

  # TODO: set private again after tests:
  # private

  # Navigates the game logic.
  def game_loop
    loop do
      set_players
      @code = @code_maker.generate_code(@valid_values, CODE_LENGTH)
      puts @code.to_s
      puts @code.class
      guessing_loop

      break if UI.exit?
    end
  end

  # Assigns new Player objects to codemaker and -breaker.
  def set_players
    @code_maker = UI.human?('Codemaker') ? HumanPlayer.new : AIPlayer.new
    @code_breaker = UI.human?('Codebreaker') ? HumanPlayer.new : AIPlayer.new
  end

  # Fetches a valid guess from the codebreaker player for a maximum of TRIES
  # times. Displays a GameOver message after that - or, in case the code has
  # been found, a winning message.
  def guessing_loop
    TRIES.times do |i|
      guess = @code_breaker.guess_code(@valid_values, CODE_LENGTH)
      hits = calculate_hits(@code, guess)
      UI.give_feedback(hits[0], hits[1], TRIES - 1 - i)

      if @code == guess
        UI.display_win
        return nil
      end
    end
    UI.display_game_over
  end

  # Takes an array and compares it to the @code. Returns the black and white
  # hits in an array.
  def calculate_hits(code, guess)
    hits = []
    black = black_hits(code, guess)
    white = white_hits(code, guess)
    hits << black << (white - black)
    hits
    # return [black, white]
  end

  def black_hits(code, guess)
    black_hits = 0
    nested_arrays = code.zip(guess)
    nested_arrays.each do |array|
      array[0] == array[1] ? black_hits += 1 : nil
    end
    black_hits
  end


  def white_hits(code, guess)
    white_hits = 0
    guess.uniq!
    guess.each do |sym|
      code.include?(sym) ? white_hits += 1 : nil
    end
    white_hits
  end
end
