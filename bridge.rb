require_relative 'pack.rb'
require_relative 'player.rb'
require_relative 'dealer.rb'

pack = Pack.new

players = [	Player.new(:North), 
			Player.new(:East), 
			Player.new(:South), 
			Player.new(:West)
		]

dealer = players[0]

dealer.shuffle(pack)
dealer.deal(pack, players)

# print out who has what cards
players.each { |player| puts "\n#{player.name} has:"
	player.hand.each { |card| puts "#{card.number} of #{card.suit}" }
}

#east leads first
players[1].leader = true

for i in 0..12

	puts "\nTrick #{i + 1}"

	leader_index = players.index { |player| player.leader }
	leader = players[leader_index]
	leader.lead
	puts "#{leader.name} leads with the #{leader.lead_card.number} of #{leader.lead_card.suit}"

	player_index = (leader_index + 1) % 4
	for i in 0..2
		current_player = players[player_index]
		current_player.play(leader.lead_card, players)
		puts "#{current_player.name} plays the #{current_player.play_card.number} of #{current_player.play_card.suit}"
		player_index = (player_index + 1) % 4
		leader = players[players.index { |player| player.leader }]
	end

	puts "#{players[players.index { |player| player.leader }].name} takes the trick"

end











