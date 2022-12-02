require 'csv'

depths = []

CSV.foreach('challenge_input.csv') do |row|
  depths << row[0] unless row.nil?
end

increased_depth = 0

depths.length.times do |i|
 if i != 0 && depths[i] > depths[i - 1]
  increased_depth += 1
 end
end

p increased_depth + 1
