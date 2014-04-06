class Dealer < Player

	def initialize
		super
	end

	def shuffle(pack)
		pack.shuffle
	end

	def deal(pack, south, east, west)
		players = [south, east, west, self]
		cards = pack.cards

		card_counter = 0
		player_counter = 0
		until card_counter > cards.length - 1
		 	players[player_counter].hand.push(cards[card_counter])

		 	card_counter = card_counter + 1
		 	
		 	player_counter = player_counter + 1
		 	if player_counter > 3
		 		player_counter = 0
		 	end
		end

	end

end
