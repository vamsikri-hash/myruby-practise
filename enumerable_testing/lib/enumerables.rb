module Enumerable
  def my_each
    len = self.length
    index = 0
    while index < len
      yield(self[index])
      index += 1
    end
    self
  end

  def my_each_with_index
    len = self.length
    index = 0
    while index < len
      yield(index, self[index])
      index += 1
    end
    self
  end

  def my_select
    len = self.length
    index = 0
    req = []
    while index < len
      req << self[index] if yield(self[index])
      index += 1
    end
    req
  end

  def my_all?
    len = self.length
    index = 0
    req = true
    while index < len
      if !(yield(self[index]))
        req = false
        break
      end
      index += 1
    end
    req
  end

  def my_any?
    len = self.length
    index = 0
    req = false
    while index < len
      if (yield(self[index]))
        req = true
        break
      end
      index += 1
    end
    req
  end

  def my_none?
    len = self.length
    index = 0
    req = true
    while index < len
      if (yield(self[index]))
        req = false
        break
      end
      index += 1
    end
    req
  end

  def my_count(num)
    req = 0
    my_each { |i| req += 1 if i == num }
    req
  end

  def my_map(pro = nil)
    len = self.length
    index = 0
    req = []
    if pro.nil?
      while index < len
        req << yield(self[index])
        index += 1
      end
    else
      while index < len
        req << pro.call(self[index])
        index += 1
      end
    end
    req
  end

  def my_inject(initial)
    len = self.length
    index = 0
    while index < len
      initial = yield(initial, self[index])
      index += 1
    end
    initial
  end
end

def multiply_els(arr)
  arr.inject(1) { |f, v| f * v }
end
