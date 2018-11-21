# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

# Class description
class MastermindCalc
  def self.match_hits(code, guess)
    unused = code.dup
    guess.each_index { |i| unused[i] = false if code[i] == guess[i] }
    blacks = unused.count(false)

    whites = 0
    guess.each_index do |i|
      next unless unused[i]
      if unused.include?(guess[i])
        unused[unused.index(guess[i])] = 0
        whites += 1
      end
    end
    [blacks, whites]
  end
end