class Stack
  def initialize
    @store = Array.new # use an array to store the data
  end

  def push(element)
    @store << element
  end

  def pop
    raise ArgumentError.new("Cannot pop an empty stack") if @store.empty? #OR self.empty? 
    @store.pop
  end

  def top
    raise ArgumentError.new("There's no top in an empty stack") if self.size == 0
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    #@store.size == 0
    @store.empty?
  end

  def to_s
    return @store.to_s
  end
end
