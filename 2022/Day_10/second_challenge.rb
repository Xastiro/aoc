require 'csv'
require 'matrix'

program = []

CSV.foreach('challenge_input.csv') do |row|
  program << row[0]
end

program.map! { |row| row.split(' ') }

cycle = 0
sprite_position = 1

crt = Array.new(6){Array.new}

def draw_crt(cycle, sprite_position, crt)
  if cycle.between?(1, 40)
    if (cycle - 1).between?(sprite_position - 1, sprite_position + 1)
      crt[0] << '#'
    else
      crt[0] << '.'
    end
  end
  if cycle.between?(41, 80)
    if (cycle - 41).between?(sprite_position - 1, sprite_position + 1)
      crt[1] << '#'
    else
      crt[1] << '.'
    end
  end
  if cycle.between?(81, 120)
    if (cycle - 81).between?(sprite_position - 1, sprite_position + 1)
      crt[2] << '#'
    else
      crt[2] << '.'
    end
  end
  if cycle.between?(121, 160)
    if (cycle - 121).between?(sprite_position - 1, sprite_position + 1)
      crt[3] << '#'
    else
      crt[3] << '.'
    end
  end
  if cycle.between?(161, 200)
    if (cycle - 161).between?(sprite_position - 1, sprite_position + 1)
      crt[4] << '#'
    else
      crt[4] << '.'
    end
  end
  if cycle.between?(201, 240)
    if (cycle - 201).between?(sprite_position - 1, sprite_position + 1)
      crt[5] << '#'
    else
      crt[5] << '.'
    end
  end
end


program.each do |instruction|

  if instruction[0] == "noop"
    cycle += 1
    draw_crt(cycle, sprite_position, crt)
  end
  if instruction[0] == "addx"
    cycle += 1
    draw_crt(cycle, sprite_position, crt)
    cycle += 1
    draw_crt(cycle, sprite_position, crt)
    sprite_position += instruction[1].to_i
  end

end

crt.each do |row|
  p row.join("")
end
