
class Game
  attr_accessor :board, :current_player, :next_player

  def initialize(player1, player2, board)
    @current_player = player1
    @next_player = player2
    @board = board
  end

  def swap(current, other)
    @current_player, @next_player = other, current
  end

  def play
    @board.display
    coun = 0
    range = 1..9
    loop do
      coun += 1
      puts "hey #{current_player.name}, Enter the number b/w (1-9)"
      value = gets.chomp.to_i
      if range.include? value
        swap(current_player, next_player) if !@board.update(value, current_player.symbol)
        if @board.result
          return "#{current_player.name} wins!"
        elsif !@board.result && coun >= 9
          return "It's a Draw!"
        end
        swap(current_player, next_player)
      else
        puts "please enter the valid no b/w 1-9"
      end
    end
  end
end
