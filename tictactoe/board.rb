
class Board
  attr_accessor :grid

  def initialize
    @grid = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    @decoding = { 1 => [0, 0],
                 2 => [0, 1],
                 3 => [0, 2],
                 4 => [1, 0],
                 5 => [1, 1],
                 6 => [1, 2],
                 7 => [2, 0],
                 8 => [2, 1],
                 9 => [2, 2] }
  end

  def display
    puts "     |      |     "
    puts "  #{@grid[0][0]}  |  #{@grid[0][1]}   |   #{@grid[0][2]}    "
    puts "_____|______|_____"
    puts "     |      |     "
    puts "  #{@grid[1][0]}  |  #{@grid[1][1]}   |   #{@grid[1][2]}    "
    puts "_____|______|_____"
    puts "     |      |     "
    puts "  #{@grid[2][0]}  |  #{@grid[2][1]}   |   #{@grid[2][2]}    "
    puts "     |      |     "
  end

  def update(value, symbol)
    x, y = @decoding[value]
    if @grid[x][y] == "X" || @grid[x][y] == "O"
      puts "It is already taken, take another position"
      display
      return false
    else
      @grid[x][y] = symbol
      display
      return true
    end
  end

  def winning_positions
    daigonals = [[@grid[0][0], @grid[1][1], @grid[2][2]],
                 [@grid[0][2], @grid[1][1], @grid[2][0]]]
    @grid + @grid.transpose + daigonals
  end

  def result
    result = true
    winning_positions.each do |arr|
      if arr.all? { |i| i == arr[0] }
        return true
      else
        result = false
      end
    end
    result
  end
end
