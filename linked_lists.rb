#linked lists

class Entry
  attr_accessor :next, :data
  
  def initialize(data)
    @next = nil
    @data = data
  end
end
