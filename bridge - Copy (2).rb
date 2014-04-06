require_relative 'pack.rb'
require_relative 'player.rb'
require_relative 'dealer.rb'

pack = Pack.new

players = {:north => Player.new,
			:east => Player.new,
			:south => Player.new,
			:west => Player.new,
		}
players_list = []
players.each { |key, value| players_list.push(key)}

players[:north].shuffle(pack)
players[:north].deal(pack, players)

# print out who has what cards
player_counter = 0
while player_counter < players_list.length
	current_player = players_list[player_counter]
	puts "\n#{current_player} has:"
	players.fetch(current_player).hand.each { |value| puts "#{value.number} of #{value.suit}" }
	player_counter = player_counter + 1
end

# east takes the first lead 
lead_card = players[:east].lead
puts "\neast led with the #{lead_card.number} of #{lead_card.suit}" 

# set the start player to the next one in the array
player_counter = players_list.index(:east) + 1
if player_counter >= players_list.length
	player_counter = 0
end

# each player plays their card
while players_list[player_counter] != :east
	highest_card = lead_card
	winner = 
	played_card = players.fetch(players_list[player_counter]).play(lead_card)

	if played_card.suit == highest_card.suit and played_card.number > highest_card.number
		if 
			highest_card = played_card
			winner = players.fetch(players_list[player_counter])
		end
	end

	player_counter = player_counter + 1
	if player_counter >= players_list.length
		player_counter = 0
	end
end

puts winner
puts players[:south].played_card
puts players[:west].played_card
puts players[:north].played_card


