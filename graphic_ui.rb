# Aufgabe a07
# Team ChillyCrabs | NeamTame
# Author:: Lennart Draeger
# Author:: Robert Gnehr

# Class for console interaction in the Mastermind game.
class GraphicUI

  def self.human?(name)
    system "cls"
    puts "Choose #{name}: [H]uman [C]omputer\n\n"
    loop do
      player = gets.chomp.downcase
      return true if player == 'h'
      return false if player == 'c'

      system "cls"
      puts "Choose #{name}:\nInvalid option. Type [H] for a human or [C] for a computer player.\n\n"
    end
  end

  def self.ask_for_new_code(valid_values_ary, expected_length)
    system "cls"
    puts 'Generate a new code:'
    puts "Insert #{expected_length} of the following values: #{valid_values_ary.join(', ')}."
    puts "You may choose any of them more than once.\n\n"
  end

  def self.ask_for_guess(valid_values_ary, expected_length, previous_guesses)
    system "cls"
    puts 'Code has been set up successfully. Now it\'s guessing time...'
    puts "Insert #{expected_length} of the following values:"
    puts "#{valid_values_ary.join(', ')}."
    puts "Any of them may appear more than once. Type [C] to display a clue.\n\n"
    append(previous_guesses)
  end

  def self.get_console_input(try_count = -1)
    printf("%-3s%-4s", "#{try_count}", "|") if try_count > 0
    gets.strip.split(/\s+|,\s*/)
  end

  def self.confirm
    print 'Press [Enter] to continue...'
    gets
    return nil
  end

  def self.display_feedback(black_hits, white_hits, remaining_tries)
    puts "#{black_hits} black hit#{black_hits == 1 ? '' : 's'} and " +
             "#{white_hits} white hit#{white_hits == 1 ? '' : 's'}. You have " +
             "#{remaining_tries} #{remaining_tries == 1 ? 'try' : 'tries'} remaining."
  end

  def self.display_guess(guess)
    puts "Guessing... #{guess.join(' ')}"
  end

  def self.display_wrong_length(expected_length, actual_length)
    puts "Wrong number of values. Expected #{expected_length}, but found #{actual_length}."
  end

  def self.display_wrong_symbols(false_values)
    puts "Wrong values chosen. #{false_values.join(', ')} " +
             "#{false_values.size > 1 ? 'are not valid symbols' : 'is not a valid symbol'}."
  end

  def self.display_win(remaining_tries)
    puts "\nHooray, the code was found. Codebreaker wins with " +
             "#{remaining_tries} #{remaining_tries == 1 ? 'try' : 'tries'} to spare."
  end

  def self.display_game_over(expected_code)
    puts "\nOh noes, the code wasn't found in time. Codemaker wins."
    puts "The right code was #{expected_code.join(',')}."
  end

  def self.display_clue(guess)
    puts "The AI would choose #{guess.join(', ')} next."
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

  private

  def self.append(previous)
    previous.each_with_index do |prev, i|
      printf("%-3s%-4s", "#{i + 1}", "|")
      puts "#{prev[0].join(' ')}   #{"■ " * prev[1][0]}#{"□ " * prev[1][1]} "
    end
  end
end
