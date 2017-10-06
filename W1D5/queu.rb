class Queue
  attr_reader :queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    queu.unshift(el)
  end

  def dequeue
    queu.pop
  end

  def show
    puts queue
  end
end
#enqueue(el), dequeue, and show
