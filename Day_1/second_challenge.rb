require 'csv'

calories= []

CSV.foreach("first_challenge_input.csv") do |row|
  unless row.nil?
    calories << row[0]
  end
end

elves_loadout = []

calories.slice_before{ |e| e.nil? }.map(&:compact).each do |calorie|
  elves_loadout << calorie.map(&:to_i).sum
end

print elves_loadout.max(3).sum
