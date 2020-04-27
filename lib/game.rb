require "yaml"
require "date"

class Game
  attr_accessor :player, :board, :codeword

  def initialize(player, board)
    @player = player
    @board = board
    @codeword = @board.secret.clone
  end

  def save
    Dir.mkdir("lib/saved_games") unless Dir.exists?("lib/saved_games")
    filename = "lib/saved_games/#{Date.today}-#{@player.name}.yaml"
    File.open(filename, "wb") do |file|
      file.puts(YAML.dump(self))
    end
    puts "Your game is  saved successfully..and can load at any time.."
  end

  def play
    until @board.count == 0
      puts "You have #{@board.count} chances left.."
      @board.display
      guess_char = gets.chomp
      if guess_char == "save"
        save
        exit
      elsif guess_char.length != 1
        puts "please enter only a single charcter.."
      else
        @player.guess_count += 1
        @player.guesses << guess_char
        if @codeword.include? guess_char
          @board.update(guess_char, @codeword.index(guess_char))
          @codeword[@codeword.index(guess_char)] = "-"
        else
          @board.count -= 1
        end
      end

      if @board.win?
        puts "Its a win, thanks for playing"
        exit
      end
      @board.display
    end

    if !@board.win?
      puts "you have finished your gusses.."
      puts "The secret word is #{@board.secret}"
      puts "Thanks for trying out our game.."
    end
  end

  def self.load_game(filename)
    filecontent = File.open("lib/saved_games/#{filename}")
    puts "You game is loaded please continue...."
    YAML.load(filecontent).play
  end
end
