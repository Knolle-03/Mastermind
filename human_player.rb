# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

require_relative 'ui'

# Class description
class HumanPlayer

  def generate_code(valid_values, code_length)
    code = UI.get_code_array(valid_values, code_length)
    check_code(valid_values, code, code_length)
  end

  def guess_code(valid_values, code_length)
    guess = UI.get_guess(valid_values, code_length)
    check_code(valid_values, guess, code_length)
  end

  private

  def check_code(valid_values, code, code_length)
    unless (code - valid_values).empty? && code.length == code_length
      loop do
        code = check_length(code, code_length, valid_values)
        wrong_symbols = check_symbols(code, valid_values)
        if wrong_symbols.length.zero?
          code
        else
          UI.display_wrong_symbols(wrong_symbols)
          code = UI.get_code_array(valid_values, code_length)
        end
        break if (code - valid_values).empty? && code.length == code_length
      end
    end
    code
  end

  def check_length(code, code_length, valid_values)
    if code.length != code_length
      UI.display_wrong_length(code_length, code.length)
      puts '============================================'
      code = UI.get_code_array(valid_values, code_length)
    end
    code
  end

  def check_symbols(code, valid_values)
    wrong_symbols = []
    code.each do |sym|
      unless valid_values.include?(sym)
        wrong_symbols << sym
      end
    end
    wrong_symbols
  end
end
