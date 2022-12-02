require 'csv'

strategy_guide = []

CSV.foreach('challenge_input.csv') do |row|
  strategy_guide << row[0].split(' ')
end

p strategy_guide
score = 0

strategy_guide.each do |round|
  case round
  when ["A","X"]
    score += 3 + 1
  when ["A","Y"]
    score += 6 + 2
  when ["A","Z"]
    score += 0 + 3
  when ["B","X"]
    score += 0 + 1
  when ["B","Y"]
    score += 3 + 2
  when ["B","Z"]
    score += 6 + 3
  when ["C","X"]
    score += 6 + 1
  when ["C","Y"]
    score += 0 + 2
  when ["C","Z"]
    score += 3 + 3
  end
end

p score
