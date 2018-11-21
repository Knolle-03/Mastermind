# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

require_relative 'ui'

# Class description
class AIPlayer

  def initialize(valid_values, expected_length)
    @possibilities = valid_values.repeated_permutation(4).to_a
    @previous_guess = []
    @valid_values = valid_values
    @code_length = expected_length
  end

  def generate_code
    UI.confirm_code_assignment
    (@valid_values * @code_length).sample(@code_length)
  end

  def guess_code
    puts @previous_guess.empty?
    puts @possibilities[7].join(' ')
    return @possibilities[7] if @previous_guess.empty?

    adjust_possibilities
    puts @possibilities[0].join(' ')
    @possibilities[0]
  end

  def adjust_possibilities
    @possibilities.each do |option|
      @possibilities.delete(option) unless calculate_hits(option) == @previous_guess[1]
    end
  end

  def calculate_hits(option)
    unused = @previous_guess[0].dup
    option.each_index { |i| unused[i] = false if unused[i] == option[i] }
    blacks = unused.count(false)

    whites = 0
    option.each_index do |i|
      next unless unused[i]
      if unused.include?(option[i])
        unused[unused.index(option[i])] = 0
        whites += 1
      end
    end
    [blacks, whites]
  end

  def pass_feedback(guess, hits)
    @previous_guess = [guess, hits]
  end
end
