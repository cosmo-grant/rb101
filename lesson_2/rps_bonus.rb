VALID_CHOICES = %w(rock paper scissors lizard spock)

WHO_BEATS_WHO = {
  'rock' => %w(lizard scissors),
  'lizard' => %w(spock paper),
  'spock' => %w(scissors rock),
  'scissors' => %w(lizard paper),
  'paper' => %w(rock spock)
}

def prompt(message)
  puts "=> #{message}"
end

def normalize_choice(choice)
  case choice
  when 'rock', 'r' then 'rock'
  when 'paper', 'p' then 'paper'
  when 'scissors', 'sc' then 'scissors'
  when 'lizard', 'l' then 'lizard'
  when 'spock', 'sp' then 'spock'
  end
end

def result(player_choice, computer_choice)
  if player_choice == computer_choice
    0
  elsif WHO_BEATS_WHO[player_choice].include?(computer_choice)
    1
  else
    -1
  end
end

def display_results(result, player_tally, computer_tally)
  case result
  when 1 then prompt("You won.")
  when 0 then prompt("Tie.")
  when -1 then prompt("Computer won.")
  end

  prompt("You: #{player_tally}. Computer: #{computer_tally}.")
end

loop do
  puts
  prompt("Welcome!")
  prompt("RPSLS, first to three. Here we go.")

  player_tally = 0
  computer_tally = 0
  round = 1

  # first-to-three loop
  loop do
    puts
    prompt("-----ROUND NUMBER #{round}-----")

    player_choice = nil
    # input validation loop
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}.")
      prompt("You can enter just the first letter or two.")
      prompt("e.g. p -> paper, sc -> scissors, sp -> spock")
      player_choice = gets.chomp
      player_choice = normalize_choice(player_choice)
      if player_choice
        break
      end
      puts "Invalid choice."
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You: #{player_choice}. Computer: #{computer_choice}.")

    result = result(player_choice, computer_choice)

    case result
    when 1 then player_tally += 1
    when -1 then computer_tally += 1
    end
    round += 1

    display_results(result, player_tally, computer_tally)

    break if player_tally == 3 || computer_tally == 3
  end

  puts
  if player_tally == 3
    prompt("You won the match.")
  else
    prompt("You lost the match.")
  end

  puts
  prompt("Play again?")
  response = gets.chomp
  break unless response.downcase.start_with?('y')
end

prompt("Bye")
