class Player
  attr_accessor :name, :guess_count, :guesses

  def initialize(name)
    @name = name
    @guess_count = 0
    @guesses = []
  end
end
