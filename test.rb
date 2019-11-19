class Card
def initialize(card,suit,index)
  @card,@suit,@index = card,suit,index
end
end

class Deck
  attr_accessor :cards
  def initialize
    @cards = []
    pull_deck
  end

  def random
    p cards.delete_at(rand(cards.size + 1))
  end

  def pull_deck
    card = ('1'..'10').to_a + ['B','D','K','T']
    suits = ['+', '<3', '^', '<>']
    card.each.with_index(1) do |card, index|
      suits.each do |suit|
        index = 10 if index > 10
        index = 11 if card == 'T'
        @cards << Card.new(card,suit,index)
      end
    end
  end
end

