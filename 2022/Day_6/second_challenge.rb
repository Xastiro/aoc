require 'csv'

signal = []

CSV.foreach('challenge_input.csv') do |row|
  signal << row[0]
end
signal = signal[0]

signal.split('').each_with_index do |char, index|
  if (13..signal.length).include?(index)
    string = signal[index - 13] + signal[index - 12] + signal[index - 11] + signal[index - 10] + signal[index - 9] + signal[index - 8] + signal[index - 7] + signal[index - 6] + signal[index - 5] + signal[index - 4] + signal[index - 3] + signal[index - 2] + signal[index - 1] + signal[index]
    if ("a".."z").all?{|c| string.count(c) <= 1}
      return p index + 1
    end
  end
end

# signal.chars.each_cons(14).with_index { |e, i| return p i + 14 if e.length == e.uniq.length }
