# linked lists

# frozen_string_literal: true

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
  include Enumerable
  attr_accessor :name

  def initialize
    @head = nil
    @tail = nil
  end

  def each
    return nil if @head.nil?

    entry = @head
    until entry.nil?
      yield entry
      entry = entry.next
    end
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

  def rtq
    return nil if @head.nil?

    entry = @head
    @head = @head.next
    entry
  end

  def reverse!
    return if @head.nil?

    @tmp_head = self.rtq
    @tmp_head.next = nil
    @tail = @tmp_head

    until @head.nil?
      entry = self.rtq
      entry.next = @tmp_head
      @tmp_head = entry
    end

    @head = @tmp_head
  end

  def reverse
    new_list = List.new
    self.each { |entry| new_list.ptq(Entry.new(entry.data)) }
    new_list
  end

  def size
    return nil if @head.nil?
    counter = 0

    self.each { |entry| counter += 1}
    puts "#{counter} items in the list"
  end

  def out_head
    return nil if @head.nil?

    puts "#{@head.data}"
  end

  def out_tail
    return nil if @tail.nil?

    puts "#{@tail.data}"
  end

  # at(index) returns the node at a given index
  
  # #contains?(value) returns true if value is in list

  # find(vaule) returns index of node containing vaule, nil if not found

  # to_s represent list objects as strings and output to console
  #  format should be (value) -> (value) -> (value) -> nil
end

my_list = List.new

# Add entries to the list
my_list.ptq(Entry.new("First"))
my_list.pbq(Entry.new("Second"))
my_list.pbq(Entry.new("Third"))
my_list.pbq(Entry.new("Fourth"))

my_list.each { |entry| puts entry.data }
my_list.size