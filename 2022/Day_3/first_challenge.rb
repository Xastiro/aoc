require 'csv'

rucksacks = []

CSV.foreach('challenge_input.csv') do |row|
  rucksacks << row[0].split(' ')
end

def halves(str)
  [str[0, str.size/2], str[str.size/2..-1]]
end

def most_common(rucksack)
  rucksack[0].chars().each do |char|
    if rucksack[1].include?(char)
      return char
    end
  end
end

common_items = []

rucksacks.each do |rucksack|
  common_items << most_common(halves(rucksack[0]))
end

priority_list = Hash.new
i = 1
("a".."z").to_a.each do |letter|
  priority_list[letter] = i
  i += 1
end
("A".."Z").to_a.each do |letter|
  priority_list[letter] = i
  i += 1
end

sum = 0
common_items.each do |item|
  sum += priority_list[item]
end

p sum
