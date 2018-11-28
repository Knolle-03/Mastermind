puts [1].repeated_permutation(2).to_a.to_s





# code = %w[1 2 3 2]
# guess = %w[4 2 2 3]
#
#
#
#
# guess2 = guess.dup
# code2 = code.dup
# whites = 0
# blacks = code2.zip(guess2).find_all { |a, b| a == b }.count
# guess2.each do |value|
#   if code2.include?(value)
#     code2.delete_at(code2.index(value))
#     puts code2.to_s
#     whites += 1
#   end
#   whites
# end
# hits = [blacks, whites - blacks]
#
#
# puts code2.to_s
# puts guess2.to_s
# puts '--------------------'
# puts hits[0]
# puts hits[1]











#puts blacks.to_s
#puts code.to_s

# whites = 0
# guess_uniq = guess.uniq
# guess.uniq.each do |value|
#   c = code.count(value) -
#       whites += c
#
# end
# whites = whites - blacks
# puts blacks
# puts whites
=begin
puts %w[1 2 3 2].uniq

=end





