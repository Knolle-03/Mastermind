# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

require_relative 'ui'

# Handles the input for new codes and guesses via the UI for human players.
# Also checks if this input is complying with the rules.
class HumanPlayer

  def initialize(valid_values, expected_length)
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
        generate_hint
      end
    end
  end

  def pass_feedback(guess, hits)
    @previous_guess << [guess, hits]
  end

  private

  def generate_hint
    puts 'Hier könnte IHR Hinweis stehen!'
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
