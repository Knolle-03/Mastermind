# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

# Class for console interaction in the Mastermind game.
class UI

  # Greets the player and asks if the computer or a player takes the role of
  # mastermind and codebreaker.
  def self.get_players
    puts ''
    return [maker, breaker]
  end

  # Asks Player to choose a specified amount of symbols from a given range of
  # values.
  def self.get_code_array(valid_values_ary, expected_length)
    puts ''
    # line.split(/=|;/)
    return []
  end

  # Asks player for a choice of values from an array and of a certain length.
  def self.get_guess(valid_values_ary, expected_length)
    puts ''
    return []
  end

  # Displays how many black and white hits were achieved in the last guessing
  # round. Also shows remaining number of tries.
  def self.give_feedback(black_hits, white_hits, remaining_tries)
    puts ''
  end

  # Informs the player that a wrong number of arguments/input values was found.
  def self.display_wrong_length
    puts ''
  end

  # Informs the player which input values were not valid.
  def self.display_wrong_symbols(false_values)
    puts ''
  end
end