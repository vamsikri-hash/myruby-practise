def count_substrings(string, dictionary)
  count_hash = Hash.new(0)
  dictionary.each do |word|
    if string.downcase =~ (/#{word}/)
      count_hash[word] += 1
    end
  end
  count_hash
end

dic = ["below",
       "down",
       "go",
       "going",
       "horn",
       "how",
       "howdy",
       "it",
       "i",
       "low",
       "own",
       "part",
       "partner",
       "sit"]

# for testing
p count_substrings("below", dic)
p count_substrings("Howdy partner, sit down! How's it going?", dic)
