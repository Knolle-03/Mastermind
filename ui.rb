# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

# Class for console interaction in the Mastermind game.
class UI

  def self.human?(name)
    puts "Choose #{name}: [H]uman [C]omputer"
    loop do
      player = gets.chomp.downcase
      return true if player == 'h'
      return false if player == 'c'

      puts 'Invalid option. Type [H] for a human or [C] for a computer player.'
    end
  end

  def self.ask_for_new_code(valid_values_ary, expected_length)
    puts 'Generate a new code:'
    puts "Insert #{expected_length} of the following values: #{valid_values_ary.join(', ')}."
    puts 'You may choose any of them more than once.'
    gets.strip.split(/\s+|,\s*/)
  end

  def self.ask_for_guess(valid_values_ary, expected_length)
    input = ''
    loop do
      input = gets.strip
      display_help_text(valid_values_ary, expected_length) if input.casecmp?('h')
      break unless %w[c h].include?(input.downcase)

      # TODO: display hint
      puts 'Sorry, not implemented yet.' if input.casecmp?('c')
    end
    input.strip.split(/\s+|,\s*/)
  end

  def self.confirm_code_assignment
    system "cls"
    puts 'Code has been set up successfully. Now it\'s guessing time...'
  end

  def self.display_feedback(black_hits, white_hits, remaining_tries)
    puts "#{black_hits} black hit#{black_hits == 1 ? '' : 's'} and " +
         "#{white_hits} white hit#{white_hits == 1 ? '' : 's'}. You have " +
         "#{remaining_tries} #{remaining_tries == 1 ? 'try' : 'tries'} remaining."
  end

  def self.display_wrong_length(expected_length, actual_length)
    puts "Wrong number of values. Expected #{expected_length}, but found #{actual_length}."
  end

  def self.display_wrong_symbols(false_values)
    puts "Wrong values chosen. #{false_values.join(', ')} " +
         "#{false_values.size > 1 ? 'are not valid symbols' : 'is not a valid symbol'}."
  end

  def self.display_win(remaining_tries)
    puts "Hooray, the code was found. Codebreaker wins with " +
         "#{remaining_tries} #{remaining_tries < 2 ? 'try' : 'tries'} to spare."
  end

  def self.display_game_over(expected_code)
    puts "Oh noes, the code wasn't found in time. Codemaker wins."
    puts "The right code was #{expected_code.join(',')}."
  end

  def self.display_help_text(valid_values_ary, expected_length)
    puts "Insert #{expected_length} of the following values: #{valid_values_ary.join(', ')}."
    puts 'Any of them may appear more than once.'
    puts 'Type [H] for help and [C] to display a clue. (Disabled)'
  end

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
