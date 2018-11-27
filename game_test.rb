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
    assert_equal([3, 0], MastermindCalc.match_hits(@code, %w[1 2 3 6]))


    assert_equal([0, 0], MastermindCalc.match_hits(@code, %w[4 6 6 6]))
    assert_equal([0, 0], MastermindCalc.match_hits(@code, %w[6 6 6 6]))
    assert_equal([0, 0], MastermindCalc.match_hits(@code, %w[5 4 4 5]))

    assert_equal([1, 0], MastermindCalc.match_hits(@code, %w[1 5 5 5]))
    assert_equal([1, 0], MastermindCalc.match_hits(@code, %w[4 2 5 6]))
    assert_equal([1, 0], MastermindCalc.match_hits(@code, %w[6 4 5 2]))

    assert_equal([2, 0], MastermindCalc.match_hits(@code, %w[1 6 5 2]))
    assert_equal([3, 0], MastermindCalc.match_hits(@code, %w[1 4 3 2]))

    assert_equal([0, 1], MastermindCalc.match_hits(@code, %w[5 5 5 1]))
    assert_equal([0, 2], MastermindCalc.match_hits(@code, %w[2 3 5 6]))
    assert_equal([0, 3], MastermindCalc.match_hits(@code, %w[4 1 2 3]))
    assert_equal([0, 4], MastermindCalc.match_hits(@code, %w[2 1 2 3]))

    assert_equal([1, 1], MastermindCalc.match_hits(@code, %w[1 3 5 6]))
    assert_equal([1, 2], MastermindCalc.match_hits(@code, %w[4 2 2 3]))
    assert_equal([1, 2], MastermindCalc.match_hits(@code, %w[1 6 2 3]))
    assert_equal([1, 3], MastermindCalc.match_hits(@code, %w[2 3 1 2]))

    assert_equal([2, 1], MastermindCalc.match_hits(@code, %w[1 2 2 5]))
    assert_equal([2, 2], MastermindCalc.match_hits(@code, %w[1 2 2 3]))
  end

  def test_swap_input
    assert_equal([4, 0], MastermindCalc.match_hits(%w[1 2 3 2], @code))
    assert_equal([3, 0], MastermindCalc.match_hits(%w[1 2 3 6], @code))

    assert_equal([0, 0], MastermindCalc.match_hits( %w[4 6 6 6], @code))
    assert_equal([0, 0], MastermindCalc.match_hits( %w[6 6 6 6], @code))
    assert_equal([0, 0], MastermindCalc.match_hits(%w[5 4 4 5], @code))

    assert_equal([1, 0], MastermindCalc.match_hits(%w[1 5 5 5], @code))
    assert_equal([1, 0], MastermindCalc.match_hits(%w[4 2 5 6], @code))
    assert_equal([1, 0], MastermindCalc.match_hits(%w[6 4 5 2], @code))

    assert_equal([2, 0], MastermindCalc.match_hits(%w[1 6 5 2], @code))
    assert_equal([3, 0], MastermindCalc.match_hits(%w[1 4 3 2], @code))

    assert_equal([0, 1], MastermindCalc.match_hits(%w[5 5 5 1], @code))
    assert_equal([0, 2], MastermindCalc.match_hits(%w[2 3 5 6], @code))
    assert_equal([0, 3], MastermindCalc.match_hits(%w[4 1 2 3], @code))
    assert_equal([0, 4], MastermindCalc.match_hits(%w[2 1 2 3], @code))

    assert_equal([1, 1], MastermindCalc.match_hits(%w[1 3 5 6], @code))
    assert_equal([1, 2], MastermindCalc.match_hits(%w[1 6 2 3], @code))
    assert_equal([1, 3], MastermindCalc.match_hits(%w[2 3 1 2], @code))

    assert_equal([2, 1], MastermindCalc.match_hits(%w[1 2 2 5], @code))
    assert_equal([2, 2], MastermindCalc.match_hits(%w[1 2 2 3], @code))
  end

end
