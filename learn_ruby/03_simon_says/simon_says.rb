#write your code here

def echo(word)
  word
end

def shout(word)
  word.upcase
end

def repeat(word, t = 2)
  ((word + " ") * t).strip
end

def start_of_word(word, t)
  word.slice(0, t)
end

def first_word(word)
  word.split(" ")[0]
end

def titleize(phrase)
  phrase.capitalize!
  words = phrase.split(" ")
  words.each do |i|
    unless i == "and" || i == "the" || i == "over"
      i.capitalize!
    end
  end.join(" ")
end
