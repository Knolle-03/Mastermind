# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

require_relative 'ui'
require_relative 'mastermind_calc'

# Handles game interaction for computer players. Can generate a new code
# according to given values. To guess the code previous guesses and their
# corresponding hits are stored in this class. There also is an array with all
# possible code combinations, from which all combinations get deleted each
# guessing round, that do not have matching hit values for the respectively last
# guess.
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
    @possibilities.delete_if { |option| MastermindCalc.match_hits(@previous_guess[-1][0], option) != @previous_guess[-1][1] }
  end
end
