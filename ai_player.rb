# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

require_relative 'ui'

# Class description
class AIPlayer

  def initialize(valid_values, expected_length)
    @valid_values = valid_values
    @code_length = expected_length
  end

  def generate_code
    UI.confirm_code_assignment
    (@valid_values * 4).sample(@code_length)
  end

  def guess_code
    # guess

  end
end
