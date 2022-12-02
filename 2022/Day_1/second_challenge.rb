require 'csv'

calories = []

CSV.foreach('challenge_input.csv') do |row|
  calories << row[0] unless row.nil?
end

elves_loadout = []

calories.slice_before{ |e| e.nil? }.map(&:compact).each do |calorie|
  elves_loadout << calorie.map(&:to_i).sum
end

print elves_loadout.max(3).sum
