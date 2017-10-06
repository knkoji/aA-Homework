class Stack

  attr_reader :stack
  def initialize
    # create ivar to store stack here!
    @stack = []
  end


  def add(el)
    # adds an element to the stack
    stack << el
  end

  def remove
    stack.pop
  end

  def show
    puts stack
  end
end
