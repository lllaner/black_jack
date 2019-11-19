class Deck
  attr_accessor :cards

  IMAGE_CARD = %w[B D K T].freeze
  NUMBER_CARD = ('2'..'10').to_a
  ALL_CARD = NUMBER_CARD + IMAGE_CARD
  def initialize
    @cards = []
    pull_deck
  end

  def pull_deck
    ALL_CARD.each.with_index(2) do |card, index|
      Card::SUITS.each do |suit|
        index = 10 if index > 10
        index = 11 if card == 'T'
        @cards << Card.new(card, suit, index)
      end
    end
  end
end
