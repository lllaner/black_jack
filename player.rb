class Player
  attr_accessor :name, :balance, :cards, :points
  def initialize(name, balance)
    @name = name
    @cards = []
    @balance = balance
  end

  def take_card(deck)
    @cards << deck.cards.delete(deck.cards.sample)
    calculate_points
  end

  protected

    def calculate_points
      @points = 0
      @cards.each do |card|
        if card.suit == 'T'
          card.index = 1 if @points + card.index > 21
        end
        @points += card.index
      end
    end
end
