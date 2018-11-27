# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

require_relative 'ui'
require_relative 'mastermind_calc'

#
class Player

  def initialize(valid_values, code_length)
    @possibilities = valid_values.repeated_permutation(code_length).to_a
    @previous_guesses = []
    @previous_hits = []
    @valid_values = valid_values
    @code_length = code_length
  end

  def pass_feedback(guess, hits)
    @previous_guesses << guess
    @previous_hits << hits
  end

  private

  def adjust_possibilities(prev_guess, prev_hits)
    @possibilities.delete_if { |possibility| MastermindCalc.match_hits(prev_guess, possibility) != prev_hits }
  end
end