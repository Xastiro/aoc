require 'csv'

diagnostic_report = []

CSV.foreach('challenge_input.csv') do |row|
  diagnostic_report << row[0]
end

def sum(diagnostic_report, index)
  sum = 0
  diagnostic_report.each do |binary_number|
    binary_number.split('').each_with_index do |bit, i|
      sum += 1 if bit == '1' && index == i
    end
  end
  p sum
end

def bit_criteria(report, sum)
  sum >= report.length - sum ? '1' : '0'
end

report = diagnostic_report

(0..11).each do |index|
  p index
  t_report = []
  if report.length == 1
    b_c = bit_criteria(report, sum(report, index))
    report.each do |binary_number|
      t_report << binary_number if binary_number[index] == b_c
    end
    report = t_report
    return oxygen_generator_rating = report
  end
end

p oxygen_generator_rating.to_i(2) * co2_scrubber_rating.to_i(2)
