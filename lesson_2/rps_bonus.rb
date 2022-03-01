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
  return 'rock' if %w(rock r).include?(choice)
  return 'paper' if %w(paper p).include?(choice)
  return 'scissors' if %w(scissors sc).include?(choice)
  return 'lizard' if %w(lizard l).include?(choice)
  return 'spock' if %w(spock sp).include?(choice)
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

  prompt("Your score: #{player_tally}. Computer's score: #{computer_tally}.")
end

player_tally = 0
computer_tally = 0
round = 1

loop do
  puts
  prompt("-----ROUND NUMBER #{round}-----")

  # get player's choice
  player_choice = nil
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}.")
    prompt("You can enter just the first letter or two if you like.")
    prompt("e.g. 'p' for 'paper' or 'sp' for 'spock'")
    player_choice = gets.chomp
    player_choice = normalize_choice(player_choice)
    if player_choice
      break
    end
    puts "That's not a valid choice."
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{player_choice}. Computer chose #{computer_choice}.")

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
  prompt("You're the winner.")
else
  prompt("The computer is the winner.")
end

prompt("Goodbye")
