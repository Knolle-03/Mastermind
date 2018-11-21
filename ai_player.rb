# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

require_relative 'ui'

# Class description
class AIPlayer

  def initialize(valid_values, expected_length)
    @previous_guesses = [[[1,2,3,4][1,2]], [[1,2,3,4][1,2]]]
    @valid_values = valid_values
    @code_length = expected_length
  end

  def generate_code
    UI.confirm_code_assignment
    (@valid_values * @code_length).sample(@code_length)
  end

  def guess_code
    return [] #guess
  end

  def pass_feedback(guess, hits)
    @previous_guesses << [guess, hits]
  end
end
