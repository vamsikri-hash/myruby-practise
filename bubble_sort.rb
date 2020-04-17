# basic bubbe sort
def bubble_sort(array)
  array_length = array.length
  next_length = array_length
  for i in 0...array_length - 1
    for j in 0...array_length - i - 1
      if array[j] > array[j + 1]
        array[j + 1], array[j] = array[j], array[j + 1]
      end
    end
  end
  array
end

p bubble_sort((1..5).to_a.reverse)

# optimized bubbe sort

def opt_bubble_sort(array)
  array_length = array.length
  next_length = array_length
  for i in 0...array_length - 1
    swap = false
    for j in 0...array_length - i - 1
      if array[j] > array[j + 1]
        array[j + 1], array[j] = array[j], array[j + 1]
        swap = true
      end
    end
    break if !swap
  end
  array
end

p opt_bubble_sort((1..5).to_a.reverse)

# bubble sort with block

def bubble_sort_by(array)
  array_length = array.length
  next_length = array_length
  for i in 0...array_length - 1
    swap = false
    for j in 0...array_length - i - 1
      if yield(array[j], array[j + 1]) > 0
        array[j + 1], array[j] = array[j], array[j + 1]
        swap = true
      end
    end
    break if !swap
  end
  array
end

p (bubble_sort_by(["hi", "hello", "somethingwrong", "isee", "cant", "m"]) { |l, r| l.length - r.length })
