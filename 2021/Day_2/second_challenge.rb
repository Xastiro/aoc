require 'csv'

planned_course = []

CSV.foreach('challenge_input.csv') do |row|
  planned_course << row[0].split(' ')
end

position = 0
depth = 0
aim = 0

planned_course.each do |instruction|
  case instruction[0]
  when "forward"
    position += instruction[1].to_i
    depth += aim * instruction[1].to_i
  when "down"
    aim += instruction[1].to_i
  when "up"
    aim -= instruction[1].to_i
  end
end

p position * depth
