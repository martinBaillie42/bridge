# each player can have a number of cards
# each player is called north south east west
# any player can be the dealer
class Player
    attr_accessor :hand, :leader, :lead_card
    attr :play_card, :name

    def initialize(name)
        @hand = []
        @lead_card
        @play_card
        @leader = false
        @name = name
    end

    def shuffle(pack)
        pack.shuffle
    end

    def deal(pack, players)
        cards = pack.cards

        player_counter = 0

        #  use pop for transferring from pack to players!
        (0..cards.length - 1).each { |i|
            players[player_counter].hand.push(cards[i])
            player_counter = (player_counter + 1) % 4
        }

    end

    def lead
        @lead_card = @hand.pop
    end

    def play(leading_card, players)
        # this can be refactored and the logic improved
        # no need for 'lead_card' - leader does this instead. Remove
        # rename play_card to current_card
        # rename leader to has_highest_card
        # puts "hand.length #{@hand.length}"

        (0..@hand.length - 1).each { |i|
            @play_card = @hand[i]
            if @play_card.suit == leading_card.suit and @play_card.number > leading_card.number
                players[players.index { |player| player.leader }].leader = false
                # players[players.index { |player| player.leader }].lead_card = ''
                @leader = true
                @lead_card = @play_card
                @hand.delete_at(i)
                return @play_card
            end
        }

        (0..@hand.length - 1).each { |i|
            @play_card = @hand[i]
            if @play_card.suit == leading_card.suit
                @hand.delete_at(i)
                return @play_card
            end
        }

        @play_card = @hand.pop

    end

end