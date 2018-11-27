guess = %w[1 2 3 6]
code = %w[1 2 3 2]
blacks = 0
guess.each_with_index { |value, i| blacks += 1 if value == code[i] }

# 'whites = 0
# tested_values = []
# guess.each do |value|
#   tested_values << value
#   c = code.count(value)
#   whites += c
# end'

whites = 0
guess_uniq = guess.uniq
guess.uniq.each do |value|
  c = code.count(value) -
      whites += c

end
whites = whites - blacks
puts blacks
puts whites

puts %w[1 2 3 2].uniq







