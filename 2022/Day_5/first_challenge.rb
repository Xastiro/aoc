require 'csv'

inputs = []

CSV.foreach('challenge_input.csv') do |row|
  inputs << row
end

stacks_of_crates = inputs.slice(0, inputs.find_index([])-1).reverse
rearrangement_procedure = inputs.slice(inputs.find_index([]) + 1, inputs.length)

stacks = Array.new(10){Array.new}

stacks_of_crates.each do |stack|
  (1..9).each do |i|
    stacks[i] << stack[0][(i - 1) * 4..2 + (i - 1) * 4]
  end
end
stacks = stacks.map { |e| e.reject { |c| c == "   " }.compact()}

class String
  def chars_between before, after
    self[/#{Regexp.escape(before)}(.*?)#{Regexp.escape(after)}/m, 1]
  end
end

rearrangement_procedure.each do |procedure|
  times = procedure[0].chars_between("move ", " from ").to_i
  origin = procedure[0].chars_between(" from ", " to ").to_i
  destination = procedure[0][-1].to_i

  times.times do
    stacks[destination] << stacks[origin].last
    stacks[origin].pop
  end

end

stacks.each do |stack|
  p stack.last
end
