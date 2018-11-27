# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr
#
require 'test/unit'
require_relative 'mastermind_calc'

#
class GameTest < Test::Unit::TestCase
  def setup
    @code = %w[1 2 3 2]
  end

  def test_calculate_hits
    assert_equal([4, 0], MastermindCalc.match_hits(@code, %w[1 2 3 2]))
    assert_equal([4, 0], MastermindCalc.match_hits(@code, %w[1 2 3 2 6 8 9]))
    # oops - check for code length

    assert_equal([0, 0], MastermindCalc.match_hits(@code, %w[4 6 9 z]))
    assert_equal([0, 0], MastermindCalc.match_hits(@code, %w[6 6 6 6]))
    assert_equal([0, 0], MastermindCalc.match_hits(@code, [1, 2, 3, 2]))

    assert_equal([1, 0], MastermindCalc.match_hits(@code, %w[1 5 5 5]))
    assert_equal([1, 0], MastermindCalc.match_hits(@code, %w[8 2 8 8]))
    assert_equal([1, 0], MastermindCalc.match_hits(@code, [1, 2, 3, "2"]))

    assert_equal([2, 0], MastermindCalc.match_hits(@code, %w[1 2 a s]))
    assert_equal([3, 0], MastermindCalc.match_hits(@code, %w[y 2 3 2]))

    assert_equal([0, 1], MastermindCalc.match_hits(@code, %w[5 5 5 1]))
    assert_equal([0, 2], MastermindCalc.match_hits(@code, %w[2 3 a a]))
    assert_equal([0, 3], MastermindCalc.match_hits(@code, %w[4 1 2 3]))
    assert_equal([0, 4], MastermindCalc.match_hits(@code, %w[2 1 2 3]))

    assert_equal([1, 1], MastermindCalc.match_hits(@code, %w[1 3 a a]))
    assert_equal([1, 2], MastermindCalc.match_hits(@code, %w[1 a 2 3]))
    assert_equal([1, 3], MastermindCalc.match_hits(@code, %w[2 3 1 2]))

    assert_equal([2, 1], MastermindCalc.match_hits(@code, %w[1 2 2 a]))
    assert_equal([2, 2], MastermindCalc.match_hits(@code, %w[1 2 2 3]))
  end
end
