# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

require_relative 'Player'

# Handles game interaction for computer players. Can generate a new code
# according to given values. To guess the code previous guesses and their
# corresponding hits are stored in this class. There also is an array with all
# possible code combinations, from which all combinations get deleted each
# guessing round, that do not have matching hit values for the respectively last
# guess.
class AIPlayer < Player

  def initialize(valid_values, code_length)
    super(valid_values, code_length)
  end

  def generate_code
    UI.confirm_code_assignment
    (@valid_values * @code_length).sample(@code_length)
  end

  def guess_code
    if @previous_guesses.empty?
      first_guess = @possibilities[7].nil? ? @possibilities[0] : @possibilities[7]
      UI.display_guess(first_guess)
      return first_guess
    end

    adjust_possibilities(@previous_guesses[-1], @previous_hits[-1])
    UI.display_guess(@possibilities[0])
    @possibilities[0]
  end
end
