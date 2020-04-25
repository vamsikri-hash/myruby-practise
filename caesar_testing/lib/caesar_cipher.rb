def caesar_cipher(sentence, key)
  alphabet = ("a".."z").to_a
  words = sentence.split(" ")
  words.each do |word|
    word_a = word.split("")
    word_a.each do |letter|
      small_letter = letter.downcase
      if alphabet.include? (small_letter)
        i = alphabet.index(small_letter)
        new_i = (i + key) % 26
        if letter == small_letter
          letter.replace alphabet[new_i]
        else
          letter.replace alphabet[new_i].upcase
        end
      else
        letter
      end
    end

    word.replace word_a.join("")
  end

  words.join(" ")
end

p caesar_cipher("What a string! $%&*(%$", 5)
