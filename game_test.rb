# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr
#
require 'test/unit'
require_relative 'game'

#
class GameTest < Test::Unit::TestCase
  def setup
    @game = Game.new
  end

  def test_calculate_hits
    # code is [1, 2, 3, 2]
    assert_equal([0, 0], @game.calculate_hits([5, 5, 5, 5]))
    assert_equal([1, 0], @game.calculate_hits(%w[a b c d e f g]))
    assert_equal([2, 0], @game.calculate_hits([2, 2, 2, 2]))
    assert_equal([0, 1], @game.calculate_hits([5, 5, 5, 1]))
    assert_equal([0, 2], @game.calculate_hits([2, 5, 2, 5]))
    assert_equal([4, 0], @game.calculate_hits([1, 2, 3, 2]))
    assert_equal([0, 4], @game.calculate_hits([2, 3, 2, 1]))
    assert_equal([1, 3], @game.calculate_hits([2, 3, 1, 2]))
  end
end
