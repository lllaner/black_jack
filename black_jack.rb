class BlackJack
  
  attr_accessor :user, :dealer, :bank, :deck
  def initialize(name)
    @user = User.new(name, 100)
    @dealer = Dealer.new('dealer', 100)
    @bank = Bank.new
  end

  def dealer_step
    dealer.take_card(@deck)
  end

  def result
    if @user.points < 22 && @dealer.points < 22
      player_win(@dealer) if @dealer.points > @user.points
      player_win(@user) if @user.points > @dealer.points
    end
    if @dealer.points > 21
      player_win(@user) if @user.points < 22
    end
    if @user.points > 21
      player_win(@dealer) if @dealer.points < 22
    end
      draw if user.points == @dealer.points || @user.points > 21 && @dealer.points > 21
  end

  def player_win(player)
    player.balance += bank.balance
    player.name
  end

  def draw
    @user.balance += bank.balance / 2
    @dealer.balance += bank.balance / 2
    'Draw'
  end

  def new_game
    @deck = Deck.new
    @user.cards = []
    @dealer.cards = []
    @dealer.points = 0
    @user.points = 0
    rate
    dealing_cards
  end

  def dealing_cards
    2.times do
      @user.take_card(@deck)
      @dealer.take_card(@deck)
    end
  end

  def rate
    @bank.balance = 20
    @user.balance -= 10
    @dealer.balance -= 10
  end
end
