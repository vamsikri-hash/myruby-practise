def merge(left, right)
  return left if right.empty?
  return right if left.empty?
  return [right[0]] + merge(right[1..-1], left) if right[0] <= left[0]
  [left[0]] + merge(right, left[1..-1]) if left[0] <= right[0]
end

def merge_sort(arr)
  l = arr.length
  return arr if l == 1
  left = merge_sort(arr[0..l / 2 - 1])
  right = merge_sort(arr[l / 2..-1])
  merge(left, right)
end

p merge_sort((0..100000).to_a.reverse)
