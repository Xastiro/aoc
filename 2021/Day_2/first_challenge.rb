require 'csv'

planned_course = []

CSV.foreach('challenge_input.csv') do |row|
  planned_course << row[0].split(' ')
end

position = 0
depth = 0

planned_course.each do |instruction|
  case instruction[0]
  when "forward"
    position += instruction[1].to_i
  when "down"
    depth += instruction[1].to_i
  when "up"
    depth -= instruction[1].to_i
  end
end

p position * depth
