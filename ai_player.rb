# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

require_relative 'ui'

# Class description
class AIPlayer


  def generate_code(valid_values, code_length)
    (valid_values*4).sample(code_length)
  end
end
