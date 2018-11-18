# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

require_relative 'ui'

# Class description
class HumanPlayer

  def initialize(valid_values, expected_length)
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
      return guess if code_valid?(guess)
    end
  end

  private

  def code_valid?(code)
    answer = @expected_length == code.length
    UI.display_wrong_length(@expected_length, code.length) unless answer

    wrong_symbols = []
    code.each { |sym| wrong_symbols << sym unless @valid_values.include?(sym) }
    unless wrong_symbols.empty?
      UI.display_wrong_symbols(wrong_symbols)
      answer = false
    end
    answer
  end
end
