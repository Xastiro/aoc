require 'csv'

inputs = []

CSV.foreach('challenge_input.csv') do |row|
  inputs << row
end

stacks_of_crates = inputs.slice(0, inputs.find_index([])-1).reverse
rearrangement_procedure = inputs.slice(inputs.find_index([]) + 1, inputs.length)

stacks = Array.new(10){Array.new}

stacks_of_crates.each do |stack|
  stacks[1] << stack[0][0..2]
  stacks[2] << stack[0][4..6]
  stacks[3] << stack[0][8..10]
  stacks[4] << stack[0][12..14]
  stacks[5] << stack[0][16..18]
  stacks[6] << stack[0][20..22]
  stacks[7] << stack[0][24..26]
  stacks[8] << stack[0][28..30]
  stacks[9] << stack[0][32..34]
end
  stacks = stacks.map { |e| e.reject { |c| c == "   " }.compact()}

 p rearrangement_procedure

 class String
  def string_between_markers marker1, marker2
    self[/#{Regexp.escape(marker1)}(.*?)#{Regexp.escape(marker2)}/m, 1]
  end
end

times = 0
origin = 0
destination = 0

rearrangement_procedure.each do |procedure|
  times = procedure[0].string_between_markers("move ", " from ")
  origin = procedure[0].string_between_markers(" from ", " to ")
  destination = procedure[0][-1]

  times.to_i.times do
    stacks[destination.to_i] << stacks[origin.to_i].last
    stacks[origin.to_i].pop
  end

end

stacks.each do |stack|
  p stack.last
end
