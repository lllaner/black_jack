class Card
  attr_accessor :card, :suit, :index
def initialize(card,suit,index)
  @card,@suit,@index = card,suit,index
end

  def name
    @card.to_s + suit
  end
end
