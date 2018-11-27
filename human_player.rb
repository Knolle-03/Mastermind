# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

require_relative 'Player'

# Handles the input for new codes and guesses via the UI for human players.
# Also checks if this input is complying with the rules. As previous guesses and
# their corresponding hits are stored, it also can calculate an educated guess
# towards the solution of the code.
class HumanPlayer < Player

  def initialize(valid_values, code_length)
    super(valid_values, code_length)
  end

  def generate_code
    code = []
    loop do
      UI.ask_for_new_code(@valid_values, @code_length)
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
        UI.display_wrong_length(@code_length, 0)
      elsif input[0].casecmp?('c')
        generate_hint
      elsif input[0].casecmp?('h')
        UI.ask_for_guess(@valid_values, @code_length)
      else
        return input if code_valid?(input)
      end
    end
  end

  private

  def generate_hint
    @previous_guesses.each_with_index do |guess, i|
      adjust_possibilities(guess, @previous_hits[i])
    end
    UI.display_clue(@previous_guesses.empty? ? @possibilities[7] : @possibilities[0])
  end

  def code_valid?(code)
    answer = @code_length == code.length
    UI.display_wrong_length(@code_length, code.length) unless answer

    wrong_symbols = code - @valid_values
    unless wrong_symbols.empty?
      UI.display_wrong_symbols(wrong_symbols)
      answer = false
    end
    answer
  end
end
