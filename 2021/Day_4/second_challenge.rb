require 'csv'

bingo_subsystem = []

CSV.foreach('challenge_input.csv') do |row|
  bingo_subsystem << row
end

draws = bingo_subsystem[0].map(&:to_i)
boards = bingo_subsystem.drop(1).reject { |row| row == []}.map { |row| row[0].split(' ').map(&:to_i).map { |number| {value: number, marked: false}}}.each_slice(5).to_a
boards = boards.map { |board| {grid: board, won: false}}

def board_score(board, draw)
  sum = 0
  board[:grid].each do |row|
    row.each do |number|
      sum += number.fetch(:value) if number.fetch(:marked) == false
    end
  end
  "Total score of the board is #{sum * draw}"
end

draws.each do |draw|
  boards.each do |board|
    board[:grid].each do |row|
      row.each do |number|
        number[:marked] = true if draw == number.fetch(:value)
      end
    end
  end

  boards.each do |board|

    board[:grid].each do |row|
      counter = 0
      row.each do |number|
        counter +=1 if number[:marked] == true
        if counter == 5 && board[:won] == false
          p "BINGO on a row for board #{boards.index(board)}"
          p board_score(board, draw)
          board[:won] = true
        end
      end

      counter = 0
      board[:grid].transpose.each do |row|
        counter = 0
        row.each do |number|
          counter +=1 if number[:marked] == true
          if counter == 5  && board[:won] == false
            p "BINGO on a row for board #{boards.index(board)}"
            p board_score(board, draw)
            board[:won] = true
          end
        end
      end

    end
  end
end
