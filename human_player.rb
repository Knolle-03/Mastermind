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
    unless code.each_index { |symbol| valid_values.include?(symbol) }
      code.each_index do |symbol|
        unless valid_values.include?(symbol)
          wrong_symbols << symbol
        end
      UI.display_wrong_symbols(wrong_symbols)
        end
    end
    UI.display_wrong_symbols
    break if code.each_index { |i| valid_values.include?(i) } && code.length == code_length
    end
  end
  end
end
