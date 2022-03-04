# 1

arr = ['10', '11', '9', '7', '8']
arr_sorted = arr.sort { |a, b| b.to_i <=> a.to_i }
p arr_sorted

# 2

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books_sorted = books.sort_by { |book| book[:published].to_i }
p books_sorted

# needn't have converted to intergers, since string comparison is equivalent for this test data

# 3

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
puts arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
puts arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
puts arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
puts hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
puts hsh2[:third].keys[0]

# There's a Hash#key method, which looks up keys by value! Unexpected.

# 4

arr1 = [1, [2, 3], 4]
arr1[1][1] = 4
p arr1

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4
p arr2

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4
puts hsh1

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4
puts hsh2

# 5

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

sum_of_ages = 0
munsters.each do |k, v|
  sum_of_ages += v["age"] if v["gender"] == "male"
end
puts sum_of_ages

# don't need key, so better to use Hash#each_value

# 6

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  puts "#{name} is a #{details["age"]}-year-old #{details["gender"]}"
end

# 7

# a = 2
# b = [3, 8]

# 8 

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

VOWELS = 'aeiouAEIOU'
hsh.each do |_, array| # don't need k, so better to use each_value
  array.each do |string|
    string.split('').each { |char| puts char if VOWELS.include?(char) }
  end
end

# 9

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
new_arr = arr.map do |subarr|
  subarr.sort { |a, b| b <=> a }
end
p new_arr

# 10

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
new_arr = arr.map do |hsh|
  new_hsh = {}
  hsh.each { |k, v| new_hsh[k] = v + 1 }
  new_hsh
end
p new_arr

# 11

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
new_arr = arr.map do |subarr|
  subarr.select { |int| int % 3 == 0 }
end
p new_arr

# 12

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

new_hash = arr.each_with_object({}) do |subarr, hsh|
  k, v = subarr
  hsh[k] = v
end

puts new_hash

# 13

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]
new_arr = arr.sort_by do |subarr|
  subarr.select { |int| int % 2 == 1 }
end
p new_arr

# 14

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

new_arr = hsh.values.each_with_object([]) do |sub_hsh, arr|
  if sub_hsh[:type] == 'fruit'
    colors_capitalized = sub_hsh[:colors].map {|color| color.capitalize}
    arr.push(colors_capitalized)
  else
    size_upcase = sub_hsh[:size].upcase
    arr.push(size_upcase)
  end
end
p new_arr

# 15

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

new_arr = arr.select do |hsh|
  hsh.values.flatten.all? { |int| int % 2 == 0 }
end

p new_arr

# 16
VALID_CHARS = 'abcdef0123456789'.split('')

def generate_uuid
  chars = ''
  32.times { chars << VALID_CHARS.sample }
  "#{chars[0, 8]}-#{chars[8, 4]}-#{chars[12, 4]}-#{chars[16, 4]}-#{chars[20, 12]}"
end

puts generate_uuid
