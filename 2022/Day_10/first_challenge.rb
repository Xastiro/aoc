require 'csv'

program = []

CSV.foreach('challenge_input.csv') do |row|
  program << row[0]
end

program.map! { |row| row.split(' ') }

cycle = 0
signal_strength = 1
sum_signal_strength = 0

def cycle_check(cycle, signal_strength, sum_signal_strength)
  case cycle
  when 20
    sum_signal_strength += signal_strength * cycle
  when 60
    sum_signal_strength += signal_strength * cycle
  when 100
    sum_signal_strength += signal_strength * cycle
  when 140
    sum_signal_strength += signal_strength * cycle
  when 180
    sum_signal_strength += signal_strength * cycle
  when 220
    sum_signal_strength += signal_strength * cycle
  else
    sum_signal_strength
  end
end

program.each do |instruction|

  if instruction[0] == "noop"
    cycle += 1
    sum_signal_strength = cycle_check(cycle, signal_strength, sum_signal_strength)
  end
  if instruction[0] == "addx"
    cycle += 1
    sum_signal_strength = cycle_check(cycle, signal_strength, sum_signal_strength)
    cycle += 1
    sum_signal_strength =cycle_check(cycle, signal_strength, sum_signal_strength)
    signal_strength += instruction[1].to_i
  end

end

p sum_signal_strength
