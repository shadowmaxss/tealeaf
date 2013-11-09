# Object Oriented Blackjack

# 1) Abstraction
# 2) Encapsulation

class Card
	def initialize(s, fv)
		@suit = s
		@face_value = fv
	end

	def pretty_output
		puts "The #{@face_value} of #{@suit}"	
	end
end

class Deck
end

class Player
end

class Dealer
end

class Hand
end

c1 = Card.new('F', '3')
c2 = Card.new('D', '4')

c1.pretty_output
c2.pretty_output



