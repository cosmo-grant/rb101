TARGET = 21
DEALER_LIMIT = 17

### METHODS ###

def prompt(msg)
  puts "=> #{msg}"
end

def big_prompt(msg)
  puts
  puts '===================='
  puts(msg)
  puts '===================='
  puts
end

def initialize_deck
  values = (2..10).map(&:to_s) + ['J', 'Q', 'K', 'A']
  (values * 4).shuffle
end

def deal_card(deck, hand)
  hand << deck.pop
end

def display_player_hand(hand)
  prompt('Your hand: ' + hand.join(', ') + '.')
end

def display_dealer_hand(hand, only_one=true)
  if only_one
    prompt("Dealer's hand: " + hand[0] + ', _.')
  else
    prompt("Dealer's hand: " + hand.join(', ') + '.')
  end
end

def value_of(hand)
  value = hand.sum do |card|
    if card == 'A'
      11
    elsif card.to_i == 0 # 'J', 'Q', 'K'
      10
    else
      card.to_i
    end
  end

  num_aces_left = hand.count('A')
  while value > TARGET && num_aces_left > 0
    value -= 10
    num_aces_left -= 1
  end

  value
end

def busted?(hand_value)
  hand_value > TARGET
end

def game_result(dealer_value, player_value)
  # only called when player hasn't busted
  if dealer_value > TARGET
    :dealer_busted
  elsif dealer_value > player_value
    :dealer_won
  elsif dealer_value == player_value
    :tie
  else
    :player_won
  end
end

def play_again?
  puts
  prompt("Play again (y/n)?")
  gets.chomp.downcase.start_with?('y')
end

def display_result(reason_game_ends, player_value, dealer_value)
  big_prompt('Result')
  prompt("Your hand's value is #{player_value}.")
  prompt("Dealer's hand's value is #{dealer_value}.")
  case reason_game_ends
  when :player_busted
    prompt('You busted. Dealer wins.')
  when :dealer_busted
    prompt('Dealer busted. You win.')
  when :dealer_won
    prompt('Dealer wins.')
  when :tie
    prompt('Tie.')
  when :player_won
    prompt('You win.')
  end
end

### GAME PLAY ###

loop do
  big_prompt("Welcome to #{TARGET}.")

  deck = initialize_deck
  player_hand = []
  dealer_hand = []

  # initial deal
  2.times do |_|
    deal_card(deck, player_hand)
    deal_card(deck, dealer_hand)
  end

  display_player_hand(player_hand)
  display_dealer_hand(dealer_hand)

  player_value = value_of(player_hand)
  dealer_value = value_of(dealer_hand)

  reason_game_ends = loop do
    # player's turn
    reason_turn_ends = loop do
      hit_or_stay = nil
      loop do
        prompt("Hit (h) or stay (s)?")
        hit_or_stay = gets.chomp.downcase
        break if ['hit', 'h', 'stay', 's'].include?(hit_or_stay)
        prompt("Invalid response.")
      end
      break :player_stayed if hit_or_stay.start_with?('s')
      deal_card(deck, player_hand)
      display_player_hand(player_hand)
      player_value = value_of(player_hand)
      break :player_busted if busted?(player_value)
    end

    break :player_busted if reason_turn_ends == :player_busted
    prompt('You chose to stay.')

    big_prompt("Dealer's turn")
    display_dealer_hand(dealer_hand, false)
    while value_of(dealer_hand) < DEALER_LIMIT
      deal_card(deck, dealer_hand)
      prompt('Dealer hits.')
      display_dealer_hand(dealer_hand, false)
    end
    dealer_value = value_of(dealer_hand)
    prompt('Dealer stays.') unless busted?(dealer_value)

    break game_result(dealer_value, player_value)
  end

  display_result(reason_game_ends, player_value, dealer_value)
  break unless play_again?
  system('clear')
end

prompt('Thanks for playing.')
