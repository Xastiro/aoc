require 'csv'

strategy_guide = []

CSV.foreach('challenge_input.csv') do |row|
  strategy_guide << row[0].split(' ')
end

score = 0

strategy_guide.each do |round|
  case round[1]
  when "X"
    score += 0
    case round[0]
    when "A"
      score += 3
    when "B"
      score += 1
    when "C"
      score += 2
    end
  when "Y"
    score += 3
    case round[0]
    when "A"
      score += 1
    when "B"
      score += 2
    when "C"
      score += 3
    end
  when "Z"
    score += 6
    case round[0]
    when "A"
      score += 2
    when "B"
      score += 3
    when "C"
      score += 1
    end
  end
end

p score
