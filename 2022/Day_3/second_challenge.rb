require 'csv'

rucksacks = []

CSV.foreach('challenge_input.csv') do |row|
  rucksacks << row[0].split(' ')
end

p groups = rucksacks.each_slice(3).to_a

def common_item(group)
  group[0][0].chars().each do |char|
    if group[1][0].include?(char) && group[2][0].include?(char)
      return char
    end
  end
  return
end

common_items = []
groups.each do |group|
  common_items << common_item(group)
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
common_items.compact().each do |item|
  sum += priority_list[item]
end

p sum
