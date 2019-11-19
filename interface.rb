class Interface
  def initialize
    @game = BlackJack.new(introduction)
  end

  def show_cards(player, show = true)
    if show
      puts "#{player.name}, cards: #{player.cards.map(&:name).join(', ')}, total points: #{player.points}"
    else
      puts "#{player.name}, cards: #{player.cards.size}, total points: secret"
    end
  end

  def new_game
    
    @game.new_game
    show_cards(@game.user)
    show_cards(@game.dealer, falce)
    step
  end
 
  def step
    puts menu_option
    case gets.chomp.to_i
    when 1
      @game.user.take_card(@game.deck)
      @game.dealer_step
      show_cards(@game.user)
      show_cards(@game.dealer, true)
      puts @game.result
      puts after_result_menu
      game_end
    when 2
      @game.dealer_step
      show_cards(@game.user)
      show_cards(@game.dealer, false)
    when 3
      show_cards(@game.user)
      show_cards(@game.dealer, true)
      puts @game.result
      puts after_result_menu
      game_end
    end
    step
  end

  def introduction
    puts "Please enter your name"
    gets.chomp
  end

  def game_end
    case gets.chomp.to_i
    when 1
      new_game
    when 2
      exit
    end
  end

  def after_result_menu
    [
       "1 - Продолжить игру",
       "2 - Закончить игру"
    ]
  end

  def menu_option
    [
      '1 - Взять карту',
      '2 - Пропустить ход',
      '3 - Открыть карты'
    ]
  end
end
