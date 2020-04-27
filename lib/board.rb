

class Board
  attr_accessor :word, :count, :secret

  def initialize
    @secret = random_selection.clone
    @count = @secret.length
    @word = ""
    @secret.length.times { @word << "-" }
  end

  def display
    puts @word
  end

  def update(guess_char, index)
    @word[index] = guess_char
  end

  def win?
    @secret == @word && @count > 0
  end

  private

  def random_selection
    File.open("lib/new.txt") do |file|
      random_number = rand(48839)
      word = file.readlines[random_number].chomp.downcase
    end
  end
end
