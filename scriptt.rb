
code = ["4", "2", "6", "7"]
guess = ["1", "3", "6", "4"]
numbers = %w[1 2 3 4 5 6]

possibilities = numbers.repeated_permutation(4).to_a
puts possibilities[7]
puts possibilities.index(["1", "1", "2", "2"])







