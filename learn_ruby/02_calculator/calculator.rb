#write your code here

def add(a, b)
  a + b
end

def subtract(a, b)
  a - b
end

def sum(arr)
  if arr.reduce(:+)
    arr.reduce(:+)
  else
    0
  end
end

def multiply(*args)
  args.reduce(:*)
end

def power(a, b)
  a ** b
end

def factorial(a)
  if a == 0 || a == 1
    1
  else
    a * factorial(a - 1)
  end
end
