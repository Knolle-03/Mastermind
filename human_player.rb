# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

require_relative 'ui'

# Class description
class HumanPlayer


  def generate_code(valid_values, code_length)
    loop do
      wrong_symbols = []
      code = UI.get_code_array(valid_values, code_length)
      unless code.length == code_length
        UI.display_wrong_length(code_length, code.length)
      end
      code.each do |symbol|
        unless valid_values.include?(symbol)
          wrong_symbols << symbol
        end
      end
      if wrong_symbols.length.zero?
        code
      else
        UI.display_wrong_symbols(wrong_symbols)
        UI.get_code_array(valid_values, code_length)
      end
      break if code.each_index { |i| valid_values.include?(i) } && code.length == code_length
    end
  end

  # #refactor to?
  #
  # def generate_code(valid_values, expected_length)
  #   code = []
  #   loop do
  #     code = UI.get_code_array(valid_values, expected_length)
  #     break if validate_code(code, valid_values, expected_length)
  #   end
  #   code
  # end
  #
  # private
  #
  # def validate_code(code, valid_values, expected_length)
  #   answer = expected_length == code.length
  #   UI.display_wrong_length(expected_length, code.length) unless answer
  #
  #   wrong_symbols = []
  #   code.each { |sym| wrong_symbols << sym unless valid_values.include?(sym) }
  #   unless wrong_symbols.empty?
  #     UI.display_wrong_symbols(wrong_symbols)
  #     answer = false
  #   end
  #   answer
  # end
end
