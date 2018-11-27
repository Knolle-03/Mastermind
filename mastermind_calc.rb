# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

# Utility class, that handles the hit calculation. Each value its right position
# in the array counts towards black hits. If the remaining values are also
# included in the array, but not at the right position, they count towards white
# hits. Returns black and white hits as an array.
class MastermindCalc
  # def self.match_hits(code, guess)
  #   unused = code.dup
  #   guess.each_index { |i| unused[i] = false if code[i] == guess[i] }
  #   blacks = unused.count(false)
  #
  #   whites = 0
  #   guess.each_index do |i|
  #     next unless unused[i]
  #     if unused.include?(guess[i])
  #       unused[unused.index(guess[i])] = 0
  #       whites += 1
  #     end
  #   end
  #   [blacks, whites]
  # end

  def self.match_hits(code, guess)
    blacks = 0
    guess.each_with_index {|value, i| blacks += 1 if value == code[i]}

    whites = 0
    guess.uniq.each { |value| whites += code.count(value) }
    whites = whites - blacks
    [blacks, whites]
  end


end
