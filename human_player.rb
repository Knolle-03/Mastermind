# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

require_relative 'ui'
require_relative 'mastermind_calc'

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
      UI.ask_for_new_code(@valid_values, @expected_length)
      code = UI.get_console_input
      break if code_valid?(code)
    end
    UI.confirm_code_assignment
    code
  end

  def guess_code
    loop do
      input = UI.get_console_input
      if input[0].nil?
        UI.display_wrong_length(@expected_length, 0)
      elsif input[0].casecmp?('c')
        generate_hint
      elsif input[0].casecmp?('h')
        UI.ask_for_guess(@valid_values, @expected_length)
      else
        return input if code_valid?(input)
      end
    end
  end

  def pass_feedback(guess, hits)
    @previous_guess << [guess, hits]
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
