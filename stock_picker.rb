#used stdlib combination
#refer here https://ruby-doc.org/core-1.9.3/Array.html#method-i-combination

def stcok_picker(stocks)
  best = [0, 0]
  stocks.combination(2).map { |i, j| best = [i, j] if j - i > best[1] - best[0] }
  [stocks.index(best[0]), stocks.index(best[1])]
end

p stcok_picker([17, 3, 6, 9, 158, 6, 1, 10])
