# 1

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}
flintstones.each_with_index do |item, index|
  flintstones_hash[item] = index
end

puts flintstones_hash

# 2

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

sum = 0
ages.values.each { |item| sum += item }
puts sum

# 3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.delete_if { |k, v| v >= 100 } # in place
puts ages

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages = ages.select { |k,v| v < 100 } # not in place
puts ages

# 4

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# fancy way
min_age = ages.values.min { |a, b| a <=> b } # can omit the block!
puts min_age

# straightforward way
ages_array = ages.values
current_min_age = ages_array.shift
ages_array.each { |age| current_min_age = age if age < current_min_age }
puts current_min_age

# 5

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
puts flintstones.index { |name| name.start_with?('Be') }

# 6

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones = flintstones.map { |name| name.slice(0, 3) }
p flintstones

# or could modify in place with map!
# maybe better is name[0, 3] instead of name.slice(0, 3)
# remember that [] and slice are aliases

# 7

statement = "The Flintstones Rock"

# not so good way?
counts_hash = {}
statement.split('').each do |char|
  if char != ' '
    counts_hash[char] ? counts_hash[char] += 1 : counts_hash[char] = 1
  end
end
puts counts_hash

counts_hash = {}
chars_array = statement.split('')
chars_array.each do |char|
  counts_hash[char] = chars_array.count(char) if char != ' '
end
puts counts_hash

# 8

# outputs 1 then 3
# assuming that Array#each is implemented as we did using the loop method

# outputs 1 then 2
# similar reason to above

# punchline: iterators work on the original array dynamically, so don't modify as you iterate!

# 9

def titleize(string)
  string.split.map { |word| word.capitalize }.join(' ')
end

puts titleize("This is a title")

# 10

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.values.each do |v|
  if v['age'] < 18
    v['age_group'] = 'kid'
  elsif v['age'] < 65
    v['age_group'] = 'adult'
  else
    v['age_group'] = 'senior'
  end
end

# can actually use a case statement here, because e.g. the threequals method on ranges tests inclusion!

puts munsters



