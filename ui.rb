# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

# Class for console interaction in the Mastermind game.
class UI

  # Asks if a given player role is filled by a human player or a computer
  # algorithm. Loops until a valid choice is made.
  def self.human?(name)
    puts "Choose #{name}: [H]uman [C]omputer"
    loop do
      player = gets.chomp.downcase
      return true if player == 'h'
      return false if player == 'c'

      puts 'Invalid option. Type [H] for a human or [C] for a computer player.'
    end
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

  # Displays a message for when the right code was guessed.
  def self.display_win
    puts 'Hooray, the code was found. Codebreaker wins.'
  end

  # Displays a message for when there are no more tries left.
  def self.display_game_over
    puts "Oh noes, the code wasn't found in time. Codemaker wins."
  end

  # Asks the player if he wants to quit or play another round.
  def self.exit?
    puts 'Do you want to [Q]uit or [P]lay a new game?'
    loop do
      input = gets.strip.downcase
      return true if input.eql?('q')
      return false if input.eql?('p')

      puts 'Please choose [Q] to quit or [P] to play again.'
    end
  end
end
