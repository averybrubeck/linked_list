# linked lists

# List Entry
class Entry
  attr_accessor :next, :data

  def initialize(data)
    @next = nil
    @data = data
  end
end

# List
class List
  attr_accessor :name

  def initialize
    @head = nil
    @tail = nil
  end

  def ptq(entry)
    if @head.nil?
      @head = entry
      @tail = entry
    else
      entry.next = @head
      @head = entry
    end
  end

  def pbq(entry)
    if @head.nil?
      @head = entry
      @tail = entry
    else
      @tail.next = entry
      @tail = entry
    end
  end
end
