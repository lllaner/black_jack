class Dealer < Player
  def take_card(deck)
    super if @points < 17 && cards.size < 3
  end
end
