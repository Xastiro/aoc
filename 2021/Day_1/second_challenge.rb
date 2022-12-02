require 'csv'

depths = []

CSV.foreach('challenge_input.csv') do |row|
  depths << row[0] unless row.nil?
end

windows = []

depths.length.times do |i|
  if i < depths.length - 2
   windows << depths[i].to_i + depths[i + 1].to_i + depths[i + 2].to_i
  end
 end

increased_windows = 0

windows.length.times do |i|
 if i != 0 && windows[i] > windows[i - 1]
  increased_windows += 1
 end
end

p increased_windows
