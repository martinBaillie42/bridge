require_relative 'card.rb'
# create a deck of 52 cards
# each card has a suit - spades, hearts, diamonds, clubs
# each card has a value of 1 to 13
class Pack

    attr :cards

    def initialize
        @card_counter = 0
        @suits = [:hearts, :spades, :diamonds, :clubs]
        @suit_counter = 0
        @cards = []
        @cards = build_pack
    end

    def build_pack
        cards = []
        until @card_counter > 51
            number = card_number
            suit = card_suit
            cards.push(Card.new(number, suit))
            @card_counter = @card_counter + 1
        end
        cards
    end

    def card_number
        (@card_counter % 13) + 1
    end

    def card_suit
        if @card_counter % 13 == 0 and (@card_counter != 0)
            @suit_counter += 1
        end
        @suits[@suit_counter]
    end

    def shuffle
        @cards = @cards.shuffle
    end

end