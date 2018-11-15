# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

# Class for console interaction in the Mastermind game.
class UI

  # Greets the player and asks if the computer or a player takes the role of
  # mastermind and codebreaker. Loops input until valid option is chosen.
  def self.get_players
    players = []
    puts 'Choose Codemaker: [H]uman [C]omputer'
    loop do
      players[0] = gets.chomp.downcase
      break if players[0] == 'h' || players[0] == 'c'

      puts 'Invalid option. Choose [H]uman or [C]omputer'
    end
    puts 'Choose Codebreaker: [H]uman [C]omputer'
    loop do
      players[1] = gets.chomp.downcase
      break if players[1] == 'h' || players[1] == 'c'

      puts 'Invalid option. [H]uman or [C]omputer'
    end
    players
  end

  # Asks Player to choose a specified amount of symbols from a given range of
  # values.
  def self.get_code_array(valid_values_ary, expected_length)
    puts 'Generate a new code:'
    puts "Insert #{expected_length} of the following values: #{valid_values_ary.join(', ')}."
    puts 'You may choose any of them more than once.'
    gets.strip.split(/\s+|,\s*/)
  end

  # Asks player for a choice of values from an array and of a certain length.
  def self.get_guess(valid_values_ary, expected_length)
    puts 'Guess the code:'
    puts "Insert #{expected_length} of the following values: #{valid_values_ary.join(', ')}."
    puts 'Any of them may appear more than once. Press [H] for hint. (Disabled)'
    input = ''
    loop do
      input = gets
      break unless input.strip.casecmp?('h')

      # TODO: display hint
      puts 'Sorry, not implemented yet.'
    end
    input.strip.split(/\s+|,\s*/)
  end

  # Displays how many black and white hits were achieved in the last guessing
  # round. Also shows remaining number of tries.
  def self.give_feedback(black_hits, white_hits, remaining_tries)
    puts "#{black_hits} black hit#{black_hits == 1 ? '' : 's'} and #{white_hits} white hit#{white_hits == 1? '' : 's'}. You have #{remaining_tries} #{remaining_tries == 1 ? 'try' : 'tries'} remaining."
  end

  # Informs the player that a wrong number of arguments/input values was found.
  def self.display_wrong_length(expected_length, actual_length)
    puts "Wrong number of values. Expected #{expected_length}, but found #{actual_length}."
  end

  # Informs the player which input values were not valid.
  # false_values - array of any Strings to be displayed
  def self.display_wrong_symbols(false_values)
    puts "Wrong values chosen. #{false_values.join(', ')} #{false_values.size > 1 ? 'are not valid symbols' : 'is not a valid symbol'}."
  end

  # TODO: winning and loosing messages
end