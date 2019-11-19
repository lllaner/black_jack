class Card
  attr_accessor :card, :suit, :index
  SUITS = ['+', '<3', '^', '<>'].freeze

  def initialize(card, suit, index)
    @card = card
    @suit = suit
    @index = index
  end

  def ace?
    @card == 'T'
  end

  def name
    @card.to_s + suit
  end
end
