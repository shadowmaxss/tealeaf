# arr = ['alpha', 'bravo', 'charlie', 'delta']
# puts arr.shuffle

def shuffle dogs
dogs.sort_by{rand}
end

puts(shuffle(['alpha', 'bravo', 'charlie', 'delta']))
