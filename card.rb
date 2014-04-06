# Card class representing individual cards
class Card

    # The number used to represent the card (1 - 13)
    attr :number
    # The suit of the card (hearts, spades, clubs, diamonds)
    attr :suit

    def initialize(number, suit) #:notnew:
        @number = number
        @suit = suit
    end

end