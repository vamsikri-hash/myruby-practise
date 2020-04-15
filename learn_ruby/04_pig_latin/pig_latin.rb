#write your code here

def translate(phrase)
  words = phrase.split(" ")

  vowels = ["a", "e", "i", "o", "u"]
  words.each do |word|
    if vowels.include? word[0]
      word.replace word + "ay"
    else
      fvowel_index = word.index(/[aeio]/)
      word.replace word[fvowel_index..word.length] + word[0...fvowel_index] + "ay"
    end
  end

  words.join(" ")
end
