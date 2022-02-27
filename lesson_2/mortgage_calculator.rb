def prompt(message)
  puts "=> #{message}"
end

def calculate_payment(amount, rate, duration)
  amount * (rate / (1 - (1 + rate)**-duration))
end

def valid_number?(str)
  str.to_i != 0
end

def valid_percentage?(str)
  0 < str.to_f && str.to_f < 100
end

prompt("Welcome to Mortgage Calculator.")

loan_amount = nil
loop do
  prompt("Enter the loan amount:")
  loan_amount = gets.chomp
  if valid_number?(loan_amount)
    break
  else
    prompt("Hmm, that doesn't look like a valid loan amount.")
  end
end

apr = nil
loop do
  prompt("Enter the APR as a percentage:")
  apr = gets.chomp
  if valid_percentage?(apr)
    break
  else
    prompt("Hmm, that doesn't look like a valid APR.")
  end
end

duration = nil
loop do
  prompt("Enter the loan duration in years:")
  duration = gets.chomp
  if valid_number?(duration)
    break
  else
    prompt("Hmm, that doesn't look like a valid duration.")
  end
end

monthly_payment = calculate_payment(
  loan_amount.to_i,
  (apr.to_f / 100) / 12,
  duration.to_i * 12,
)

puts "Your monthly payment is #{monthly_payment}"

puts "Goodbye"



