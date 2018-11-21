# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

require_relative 'ui'
require_relative 'ai_player'

# Handles the input for new codes and guesses via the UI for human players.
# Also checks if this input is complying with the rules.
class HumanPlayer
  def initialize(valid_values, expected_length)
    @possibilities = valid_values.repeated_permutation(expected_length).to_a
    @previous_guess = []
    @valid_values = valid_values
    @expected_length = expected_length
  end

  def generate_code
    code = []
    loop do
      code = UI.ask_for_new_code(@valid_values, @expected_length)
      break if code_valid?(code)
    end
    UI.confirm_code_assignment
    code
  end

  def guess_code
    loop do
      guess = UI.ask_for_guess(@valid_values, @expected_length)
      if guess
        return guess if code_valid?(guess)
      else
        return generate_hint
      end
    end
  end

  def pass_feedback(guess, hits)
    @previous_guess << [guess, hits]
  end

  private

  def generate_hint
    @previous_guess.each do |guess|
      @possibilities.delete_if { |option| calculate_hits(option, guess) != guess[1] }
    end
    [@possibilities.length, @possibilities[0]]
  end

  def calculate_hits(option, guess)
    unused = guess[0].dup
    option.each_index { |i| unused[i] = false if unused[i] == option[i] }
    blacks = unused.count(false)

    whites = 0
    option.each_index do |i|
      next unless unused[i]
      if unused.include?(option[i])
        unused[unused.index(option[i])] = 0
        whites += 1
      end
    end
    [blacks, whites]
  end

  def code_valid?(code)
    answer = @expected_length == code.length
    UI.display_wrong_length(@expected_length, code.length) unless answer

    wrong_symbols = code - @valid_values
    unless wrong_symbols.empty?
      UI.display_wrong_symbols(wrong_symbols)
      answer = false
    end
    answer
  end
end
