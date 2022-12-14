require 'csv'

notes = []

CSV.foreach('challenge_input.csv') do |row|
  notes << row
end

monkeys = Array.new(8){ Hash.new }

monkeys = notes.each_slice(7).map do |monkey_data|
  {
  id: monkey_data[0][0][/\d+/].to_i,
  items: monkey_data[1].map { |item| p item[/\d+/].to_i },
  operation:  ->(old) { eval(monkey_data[2][0].split(" = ").last) },
  worry_checker: ->(worry_level) { worry_level % monkey_data[3][0][/\d+/].to_i == 0 },
  target_if_worry: monkey_data[4][0][/\d+/].to_i,
  target_if_calm: monkey_data[5][0][/\d+/].to_i,
  count: 0
  }
end

20.times do
  monkeys.each do |monkey|
    monkey[:items].each do |item|
      worry = (monkey[:operation].(item) / 3).floor
      monkey[:count] += 1
      if monkey[:worry_checker].(worry)
       monkeys[monkey[:target_if_worry]][:items] << worry
      else
        monkeys[monkey[:target_if_calm]][:items] << worry
      end
    end
    monkey[:items].clear
  end
end


count = []
monkeys.each do |monkey|
  count << monkey[:count]
end
p count
p count.max(2).reduce(:*)
