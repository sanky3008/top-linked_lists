class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :head_node

  def initialize(head_node = nil)
    @head_node = head_node
  end

  def append(value)
    if !@head_node
      @head_node = Node.new(value, nil)
    else
      last_node = self.last_node
      new_node = Node.new(value, nil)
      last_node.next_node = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value, @head_node)
    @head_node = new_node
  end

  def size
    length = 1
    pointer = @head_node
    while pointer.next_node
      pointer = pointer.next_node
      length += 1
    end
    length
  end

  def head
    @head_node.value
  end

  def tail
    self.last_node().value
  end

  def at(index)
    pointer = @head_node
    while index >= 0 do
      if !pointer.next_node
        puts "\nThere are not enough elements in the list"
      end

      pointer = pointer.next_node
      index -= 1
    end
  end

  def pop
    pointer = @head_node
    while pointer.next_node.next_node
      pointer = pointer.next_node
    end

    last = pointer.next_node
    pointer.next_node = nil

    return last
  end

  def contains?(value)
    pointer = @head_node
    while pointer.value
      if pointer.value == value
        return true
      end
    end

    return false
  end

  def find(value)
    pointer = @head_node
    i = 0
    while pointer.value
      i++
      if pointer.value == value
        return i
      end
    end

    return nil
  end

  def to_s
    pointer = @head_node
    str = ""
    while pointer
      str += "(#{pointer.value}) -> "
      pointer = pointer.next_node
    end

    return str += "nil"
  end

  # HELPER METHODS
  def last_node()
    pointer = @head_node
    while pointer.next_node
      pointer = pointer.next_node
    end
    pointer
  end
end
