def alpha_sort arr
	return arr if arr.length <= 1

	middle = arr.pop
	less = arr.select{|x| x.downcase < middle.downcase}
	more = arr.select{|x| x.downcase >= middle.downcase}

	alpha_sort(less) + [middle] + alpha_sort(more)
end

words = ['alpha', 'Bravo', 'charlie', 'Delta', 'beta']
puts(alpha_sort(words).join(' '))
