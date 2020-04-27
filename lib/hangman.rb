require "./lib/player.rb"
require "./lib/game.rb"
require "./lib/board.rb"

puts "do you want oload game.. ? yes or no"
status = gets.chomp.downcase
if status == "yes"
  puts "Can I know your name please.."

  saved_name = gets.chomp.downcase

  filenames = Dir.entries("lib/saved_games")
                 .select { |f| f =~ /.yaml/ }
                 .select { |f| f =~ /#{saved_name}/ }

  Game.load_game(filenames[0])
else
  puts "Can you enter you name...?"

  name = gets.chomp.downcase
  player = Player.new(name)
  board = Board.new
  Game.new(player, board).play
end
