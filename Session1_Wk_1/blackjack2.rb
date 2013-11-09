# Blackjack Project 1
def calculate_total(cards)
  # [ ['H', '3'], ['S', 'Q'], ...]
  arr = cards.map{|e| e[1] }

  total = 0
  arr.each do |value|
  	if value == "A"
      total += 11
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end
  end

  #correct for aces
  arr.select{|e| e == "A"}.count.times do
    total -= 10 if total > 21
  end

  total
end

puts 'Are you ready to lose your money?'
puts 'Let\'s play some blackjack!'


suits = ['H', 'D', 'C', 'S']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

deck = suits.product(cards)
deck.shuffle!

# Now we're gonna deals some cards!
playerhand = []
dealerhand = []

playerhand << deck.pop
dealerhand << deck.pop
playerhand << deck.pop
dealerhand << deck.pop

dealertotal = calculate_total(dealerhand)
mytotal = calculate_total(playerhand)

# Show the cards
puts "The dealer has: #{dealerhand[0]} and #{dealerhand[1]}, for a total of #{dealertotal}"
puts "You have: #{playerhand[0]} and #{playerhand[1]}, for a total of #{playertotal}"
puts
puts "1) Hit or 2) Stay ?"
hit_or_stay = gets.chomp

