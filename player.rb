# Each player can have a number of cards. Each player is called north south east west.
# Each player can be the dealer
class Player

    # the cards the player holds
    attr_accessor :hand

    # is the player the leader
    attr_accessor :leader

    # if the player is the leader, this is the card they lead with
    attr_accessor :lead_card

    # the card the player plays
    attr :play_card

    # the name of the player (north, south, east, west)
    attr :name

    def initialize(name) #:notnew:
        @hand = []
        @lead_card
        @play_card
        @leader = false
        @name = name
    end

    # Rearranges the pack into a random order.
    #
    # ==== Attributes
    #
    # * +pack+ The pack object, containing all the cards.
    def shuffle(pack)
        pack.shuffle
    end

    # Assigns a card to each player i turn. The pack is dealt in order.
    #
    # ==== Attributes
    #
    # * +pack+ The pack object, containing all the cards.
    # * +players+ An array of players.
    def deal(pack, players)
        cards = pack.cards

        player_counter = 0

        (0..cards.length - 1).each { |i|
            players[player_counter].hand.push(cards[i])
            player_counter = (player_counter + 1) % 4
        }

    end

    # If the player is leading the Trick, this plays their lead card
    def lead
        @lead_card = @hand.pop
    end

    # Decides which card the player will play in response to the lead card.
    #
    # ==== Attributes
    #
    # * +leading_card+ The card the first player led with.
    # * +players+ An array of players.
    def play(leading_card, players)

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