class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end
end

class LinkedList
  attr_accessor :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    new_node = Node.new(value)
    @head.nil? ? @head = new_node : @tail.next_node = new_node
    @tail = new_node
    @size += 1
  end

  def prepend(value)
    new_node = Node.new(value)
    @head.nil? ? @head = new_node : new_node.next_node = @head
    @head = new_node
    @size += 1
  end

  def at(index)
    empty_list?
    return "Index out of range" if @size < index + 1
    node = @head
    @size.times do |i|
      return node if i == index
      node = node.next_node
    end
  end

  def pop
    empty_list?
    node = @tail
    if @size == 1
      @head = @tail = nil
    else
      @tail = at(@size - 2)
      @tail.next_node = nil
    end
    @size -= 1
    node
  end

  def contains?(value)
    empty_list?
    node = @head
    @size.times do
      return true if node.value == value
      node = node.next_node
    end
    false
  end

  def find(value)
    empty_list?
    node = @head
    @size.times do |i|
      return i if node.value == value
      node = node.next_node
    end
    false
  end

  def to_s
    empty_list?
    node = @head
    arr = []
    @size.times do
      arr << "(#{node.value}) -> "
      node = node.next_node
    end
    (arr << "nil").join()
  end

  def insert_at(value, index)
    empty_list?
    return prepend(value) if index == 0
    new_node = Node.new(value)
    new_node.next_node = at(index)
    at(index - 1).next_node = new_node
    @size += 1
  end

  def remove_at(index)
    empty_list?
    if index == 0
      @head = @head.next_node
    else
      at(index - 1).next_node = at(index).next_node
    end
    @size -= 1
  end

  def empty?
    (@size.nil? || @size == 0) ? true : false
  end

  def empty_list?
    return "Empty List" if empty?
  end
end

# testing
l = LinkedList.new
l.append(10)
l.prepend(20)
l.insert_at(30, 1)
l.remove_at(1)
p l.size
p l.to_s
