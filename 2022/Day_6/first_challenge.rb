require 'csv'

signal = []

CSV.foreach('challenge_input.csv') do |row|
  signal << row[0]
end
signal = signal[0]

signal.split('').each_with_index do |char, index|
  if (3..signal.length).include?(index)
    string = signal[index - 3] + signal[index - 2] + signal[index - 1] + signal[index]
    if ("a".."z").all?{|c| string.count(c) <= 1}
      return p index + 1
    end
  end
end

# signal.chars.each_cons(3).with_index { |e, i| return p i + 3 if e.length == e.uniq.length }
