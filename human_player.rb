# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

require_relative 'graphic_ui'
require_relative 'mastermind_calc'

# Handles the input for new codes and guesses via the UI for human players.
# Also checks if this input is complying with the rules.
class HumanPlayer
  UI = GraphicUI

  def initialize(valid_values, expected_length)
    @possibilities = valid_values.repeated_permutation(expected_length).to_a
    @previous_guess = []
    @valid_values = valid_values
    @expected_length = expected_length
  end

  def generate_code
    loop do
      UI.ask_for_new_code(@valid_values, @expected_length)
      code = UI.get_console_input
      return code if code_valid?(code)
      UI.confirm
    end
  end

  def guess_code
    loop do
      UI.ask_for_guess(@valid_values, @code_length, @previous_guess)
      input = UI.get_console_input(@previous_guess.size + 1)
      if input[0].nil?
        UI.display_wrong_length(@expected_length, 0)
      elsif input[0].casecmp?('c')
        generate_hint
        UI.confirm
      else
        return input if code_valid?(input)
        UI.confirm
      end
    end
  end

  def pass_feedback(guess, hits, tries)
    @previous_guess << [guess, hits]
    if hits[0] == guess.size || tries == @previous_guess.size
      UI.ask_for_guess(@valid_values, @code_length, @previous_guess)
    end
  end

  private

  def generate_hint
    @previous_guess.each do |guess|
      @possibilities.delete_if { |option| MastermindCalc.match_hits(option, guess[0]) != guess[1] }
    end
    UI.display_clue(@previous_guess.empty? ? @possibilities[7] : @possibilities[0])
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
