# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

require_relative 'ui'

# Class description
class HumanPlayer


  def generate_code(valid_values, code_length)
    loop do
      code = UI.get_code_array(valid_values, code_length)
      if code.length == code_length
        if check_symbols(valid_values, code).length.zero?
          code
        else
          UI.display_wrong_symbols(check_symbols(valid_values, code))
          code = UI.get_code_array(valid_values, code_length)
        end
      else
        UI.display_wrong_length(code_length, code.length)
      end
      break if code.each_index { |i| valid_values.include?(i) } && code.length == code_length

      code
    end
  end

  def check_symbols(valid_values, code)
    wrong_symbols = []
    code.each do |symbol|
      unless valid_values.include?(symbol)
        wrong_symbols << symbol
      end
    end
    wrong_symbols
  end














  def guess_code(valid_values, code_length, code)
    guess = UI.get_guess(valid_values, code_length)
    if guess.length == code.length
      if check_symbols.length.zero?
        black_hits = black_hits(code, guess)
        white_hits(code, guess, black_hits)
      else
        UI.display_wrong_symbols(check_symbols(valid_values, code))
        guess = UI.get_guess(valid_values, code_length)
      end
    else
      UI.display_wrong_length(code_length, guess.length)
    end
  end

  def black_hits(code, guess)
    black_hits = 0
    nested_arrays = code.zip(guess)
    nested_arrays.each do |array|
      if array[0] == array[1]
        black_hits += 1
      end
    end
    black_hits
  end

  def white_hits(code, guess, black_hits)
    hits = [black_hits]
    white_hits = 0
    index = 0
    while index < code.length
      guess.each do |sym|
        if code.include?(sym)
          white_hits += 1
          puts white_hits
        end
        index += 1
      end
      hits << white_hits - black_hits
      hits
    end
  end

end