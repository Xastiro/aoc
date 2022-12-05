require 'csv'

assignments = []

CSV.foreach('challenge_input.csv') do |row|
  assignments << row
end

pairs_assignments = assignments.map { |assigmnment| [assigmnment[0].split("-"), assigmnment[1].split("-")]}

counter = 0

pairs_assignments.each do |pair|
  if pair[0][0].to_i >= pair[1][0].to_i && pair[0][1].to_i <= pair[1][1].to_i
    counter += 1
  end
  if pair[1][0].to_i >= pair[0][0].to_i && pair[1][1].to_i <= pair[0][1].to_i
    counter += 1
  end
  if pair[0][0].to_i == pair[1][0].to_i && pair[0][1].to_i == pair[1][1].to_i
    counter -= 1
  end
end

p counter
