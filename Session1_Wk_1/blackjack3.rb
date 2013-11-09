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

# Start the game

puts 'Are you ready to lose your money?'
puts 'Let\'s play some blackjack!'


suits = ['H', 'D', 'C', 'S']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

deck = suits.product(cards)
deck.shuffle!

# Now we're gonna deals some cards
playerhand = []
dealerhand = []

playerhand << deck.pop
dealerhand << deck.pop
playerhand << deck.pop
dealerhand << deck.pop

dealertotal = calculate_total(dealerhand)
playertotal = calculate_total(playerhand)

# Show the cards
puts "The dealer has: #{dealerhand[0]} and #{dealerhand[1]}, for a total of #{dealertotal}"
puts "You have: #{playerhand[0]} and #{playerhand[1]}, for a total of #{playertotal}"
puts

# Players Turn
if playertotal == 21
  puts "You frick'n win brutha!"
  exit
end

while playertotal < 21
  puts "1) Hit or 2) Stay ?"
  hit_or_stay = gets.chomp

  if !['1', '2'].include?(hit_or_stay)
    puts "Error: you must enter 1 or 2"
    next
  end

  if hit_or_stay == "2"
    puts "You chose to stay."
    break
  end

  # Hit
  new_card = deck.pop
  puts "Dealing card to player: #{new_card}"
  playerhand << new_card
  playertotal = calculate_total(playerhand)
  puts "Your total is now: #{playertotal}"

  if playertotal == 21
    puts "Dude your awesome, you won!"
    exit
  elsif playertotal > 21
    puts "You lost, you frickn loser, you are BUSTED!"
    exit
  end
end

# Dealers turn.

if dealertotal == 21
  puts "Sorry, the dealer won, so you lose."
  exit
end

while dealertotal < 17
  # hit
  new_card = deck.pop
  puts "Dealing a new card for the dealer: #{new_card}"
  dealerhand << new_card
  dealertotal = calculate_total(dealerhand)
  puts "Dealer total is now: #{dealertotal}"

  if dealertotal == 21
    puts "Sorry dealer hit the blackjack"
    exit
  elsif dealertotal > 21
    puts "Dealer busted, you won!"
    exit
  end
end

# Compare Hands

puts "Dealers Cards: "
dealerhand.each do |card|
  puts "=> #{card}"
end

puts "Your Cards: "
playerhand.each do |card|
  puts "=> #{card}"
end
puts

if dealertotal > playertotal
  puts "Sorry, the Dealer Won."
  elsif dealertotal < playertotal
  puts "You won!"
  else
    puts "It is a tie"
end

exit

















