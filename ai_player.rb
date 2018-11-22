# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

require_relative 'graphic_ui'
require_relative 'mastermind_calc'

# Class description
class AIPlayer
  UI = GraphicUI

  def initialize(valid_values, expected_length)
    @possibilities = valid_values.repeated_permutation(expected_length).to_a
    @previous_guess = []
    @valid_values = valid_values
    @code_length = expected_length
  end

  def generate_code
    (@valid_values * @code_length).sample(@code_length)
  end

  def guess_code(i)
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
