INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
  [1, 4, 7], [2, 5, 8], [3, 6, 9], # cols
  [1, 5, 9], [3, 5, 7] # diagonals
]

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(arr, delim=', ', last_delim='or')
  case arr.size
  when (3..)
    arr[...-1].join(delim) + "#{delim.rstrip} #{last_delim} #{arr[-1]}"
  when 2
    "#{arr[0]} #{last_delim} #{arr[-1]}"
  when 1
    arr[0].to_s
  else
    ""
  end
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system("clear")
  puts "You're #{PLAYER_MARKER} and Computer is #{COMPUTER_MARKER}."
  puts "First to 5 points is the overall winner."
  puts ""
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |     "
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = nil
  loop do
    prompt("Choose a square (#{joinor(empty_squares(brd))})")
    square = gets.chomp.to_i
    break if brd[square] == INITIAL_MARKER
    puts "Invalid choice."
  end

  brd[square] = 'X'
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if line.all? { |num| brd[num] == PLAYER_MARKER }
      return 'Player'
    elsif line.all? { |num| brd[num] == COMPUTER_MARKER }
      return 'Computer'
    end
  end
  nil
end

loop do
  player_tally = 0
  computer_tally = 0

  # first-to-five loop
  loop do
    board = initialize_board

    loop do
      display_board(board)
      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      winner = detect_winner(board)
      prompt("#{winner} won the round.")
      winner == "Player" ? player_tally += 1 : computer_tally += 1
    else
      prompt("Tie")
    end

    prompt("Player has #{player_tally} points and Computer has #{computer_tally} points.")

    break if player_tally == 5 || computer_tally == 5

    prompt("Continue to next round? (y/n)?")
    to_next_round = gets.chomp
    break if to_next_round.downcase.start_with?('n')
  end

  if player_tally == 5
    prompt("Player is the overall winner.")
  elsif computer_tally == 5
    prompt("Computer is the overall winner.")
  end
  
  prompt("Play again (y/n)?")
  play_again = gets.chomp
  break unless play_again.downcase.start_with?('y')
end

prompt("Thanks for playing.")
