require 'csv'

diagnostic_report = []

CSV.foreach('challenge_input.csv') do |row|
  diagnostic_report << row[0]
end

sum = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

diagnostic_report.each do |binary_number|
  binary_number.split('').each_with_index do |bit, index|
    sum[index] += 1 if bit == "1"
  end
end

gamma_rate = sum.map { |bit| bit > diagnostic_report.length / 2 ? 1 : 0}.join('').to_i(2)
epsilon_rate = sum.map { |bit| bit > diagnostic_report.length / 2 ? 0 : 1}.join('').to_i(2)

p gamma_rate * epsilon_rate
