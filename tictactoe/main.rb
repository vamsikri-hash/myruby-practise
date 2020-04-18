require "./player.rb"
require "./board.rb"
require "./game.rb"

def give_name
  puts "enter the player name:"
  name = gets.chomp
end

player1 = Player.new(give_name, "X")
p "your details.."
p "Name: #{player1.name}, Symbol: #{player1.symbol}"
player2 = Player.new(give_name, "O")
p "your details.."
p "Name: #{player2.name}, Symbol: #{player2.symbol}"
board = Board.new

p Game.new(player1, player2, board).play
