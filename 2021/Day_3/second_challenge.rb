require 'csv'

diagnostic_report = []

CSV.foreach('challenge_input.csv') do |row|
  diagnostic_report << row[0]
end

sums = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

diagnostic_report.each do |binary_number|
  binary_number.split('').each_with_index do |bit, index|
    sums[index] += 1 if bit == '1'
  end
end

oxygen_generator_rating = diagnostic_report

12.times do |index|
  bit_criteria = sums[index] >= oxygen_generator_rating.length / 2 ? '0' : '1'

  new_oxygen_generator_rating = []
  oxygen_generator_rating.each do |binary_number|
    new_oxygen_generator_rating << binary_number if binary_number[index] == bit_criteria
  end

  oxygen_generator_rating = new_oxygen_generator_rating
  sums = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

  oxygen_generator_rating.each do |binary_number|
    binary_number.split('').each_with_index do |bit, bit_index|
      sums[bit_index] += 1 if bit == '1'
    end
  end
  p oxygen_generator_rating.length
  p sums
end


p oxygen_generator_rating


p "100111101110".to_i(2)
p "001011000101".to_i(2)
p "100111101110".to_i(2) * "001011000101".to_i(2)
