require 'csv'
require 'matrix'

series_of_motions = []

CSV.foreach('challenge_input.csv') do |row|
  series_of_motions << row[0]
end

series_of_motions.map! { |row| row.split(' ') }

bridge = Matrix.build(350) {' '}

bridge[0, 0] = 'V'

position_X = 0
position_Y = 0
series_of_motions.each do |motion|

  if motion[0] == 'R' && motion[1].to_i == 1
    bridge[position_X, position_Y] = 'V'
    position_X += 1
  end
  if motion[0] == 'L' && motion[1].to_i == 1
    bridge[position_X, position_Y] = 'V'
    position_X -= 1
  end
  if motion[0] == 'U' && motion[1].to_i == 1
    bridge[position_X, position_Y] = 'V'
    position_Y += 1
  end
  if motion[0] == 'D' && motion[1].to_i == 1
    bridge[position_X, position_Y] = 'V'
    position_Y -= 1
  end

  if motion[0] == 'R' && motion[1].to_i != 1
    # position_X += 1
    # bridge[position_X, position_Y] = 'V'
    (motion[1].to_i - 1).times do |i|
      position_X += 1
      bridge[position_X, position_Y] = 'V'
    end
    position_X += 1
  end
  if motion[0] == 'L' && motion[1].to_i != 1
    # position_X -= 1
    # bridge[position_X, position_Y] = 'V'
    (motion[1].to_i - 1).times do |i|
      position_X -= 1
      bridge[position_X, position_Y] = 'V'
    end
    position_X -= 1
  end
  if motion[0] == 'U' && motion[1].to_i != 1
    # position_Y += 1
    # bridge[position_X, position_Y] = 'V'
    (motion[1].to_i - 1).times do |i|
      position_Y += 1
      bridge[position_X, position_Y] = 'V'
    end
    position_Y += 1
  end
  if motion[0] == 'D' && motion[1].to_i != 1
    # position_Y -= 1
    # bridge[position_X, position_Y] = 'V'
    (motion[1].to_i - 1).times do |i|
      position_Y -= 1
      bridge[position_X, position_Y] = 'V'
    end
    position_Y -= 1
  end
  # p position_X
  # p position_Y
end

# 350.times do |i|
#   350.times do |j|
#     print bridge[i, j]
#   end
#   puts " "
# end
p bridge.count('V')
