def ask question
  while true
    puts question
    reply = gets.chomp.downcase
    if reply == 'yes'
          return true
    end
    if reply == 'no'
    return false
  end
  # ask the question again.
  puts 'Please answer "yes" or "no".'
  end
end
likes_it = ask 'Do you like eating tacos?'
puts likes_it

doesnot_like_it = ask 'Do you like eating burritos?'
puts doesnot_like_it