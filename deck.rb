class Deck
  attr_accessor :cards
  def initialize
    @cards = []
    pull_deck
  end

  def pull_deck
    card = ('2'..'10').to_a + ['B','D','K','T']
    suits = ['+', '<3', '^', '<>']
    card.each.with_index(2) do |card, index|
      suits.each do |suit|
        index = 10 if index > 10
        index = 11 if card == 'T'
        @cards << Card.new(card,suit,index)
      end
    end
  end
end
