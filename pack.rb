require_relative 'card.rb'
# Creates a deck of 52 cards. Each card has a suit - spades, hearts, diamonds, clubs
# Each card has a value of 1 to 13
class Pack

    # The pack of cards.
    attr :cards

    def initialize #:notnew:
        @card_counter = 0
        @suits = [:hearts, :spades, :diamonds, :clubs]
        @suit_counter = 0
        @cards = []
        @cards = build_pack
    end

    # Assemble the pack from 52 cards, made up of the 3 suits
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

    # Return the number for the current card being added to the pack
    def card_number
        (@card_counter % 13) + 1
    end

    # Return the suit for the current card being added to the pack
    def card_suit
        if @card_counter % 13 == 0 and (@card_counter != 0)
            @suit_counter += 1
        end
        @suits[@suit_counter]
    end

    # Randomise the pack
    def shuffle
        @cards = @cards.shuffle
    end

end