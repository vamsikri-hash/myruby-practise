def fibonacci(n)
  if n == 0
    n
  else
    n == 1 ? 1 : fibonacci(n - 1) + fibonacci(n - 2)
  end
end

def fib_iter(n)
  pnum = 0
  cnum = 1
  (n - 1).times do
    ppnum, pnum = pnum, cnum
    cnum = ppnum + pnum
  end
  cnum
end

p fibonacci(12)
p fib_iter(12)
