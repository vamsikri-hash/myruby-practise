class Book
  # write your code here
  attr_accessor :title

  def title=(string)
    words = string.split(" ")
    words[0].capitalize!
    excluding_words = ["the", "a", "an", "and", "in", "of", "to"]

    words[1..words.length].map do |word|
      if excluding_words.include? word
        word
      else
        word.capitalize!
      end
    end

    @title = words.join(" ")
  end
end
