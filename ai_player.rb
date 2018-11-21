# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

require_relative 'ui'

# Class description
class AIPlayer

  def initialize(valid_values, expected_length)
    @possibilities = valid_values.repeated_permutation(expected_length).to_a
    @previous_guess = []
    @valid_values = valid_values
    @code_length = expected_length
  end

  def generate_code
    UI.confirm_code_assignment
    (@valid_values * @code_length).sample(@code_length)
  end

  def guess_code
    if @previous_guess.empty?
      UI.display_guess(@possibilities[7])
      return @possibilities[7]
    end

    adjust_possibilities
    UI.display_guess(@possibilities[0])
    @possibilities[0]
  end

  def pass_feedback(guess, hits)
    @previous_guess << [guess, hits]
  end

  private

  def adjust_possibilities
    @possibilities.delete_if { |option| calculate_hits(option) != @previous_guess[-1][1] }
  end

  def calculate_hits(option)
    unused = @previous_guess[-1][0].dup
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
end
