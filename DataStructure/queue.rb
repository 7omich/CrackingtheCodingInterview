# Time complexity: enqueue -> O(1), dequeue -> O(1)
# Input format is as follows (Round-robin Scheduling):
# 5 100
# p1 150
# p2 80
# p3 200
# p4 350
# p5 20

n, q = gets.chomp.split(' ').map(&:to_i)
arr = []
(0...n).each do |i|
  arr[i]= gets.chomp.split(' ')
end

class Queue
  attr_accessor :head, :tail, :queue

  def initialize(size)
    @head = 0
    @tail = 0
    @queue = Array.new(size)
  end

  def enqueue(x)
    @queue[@tail] = x
    if @tail + 1 == @queue.size
      @tail = 0
    else
      @tail += 1
    end
  end

  def dequeue
    x = @queue[@head]
    if @head + 1 == @queue.size
      @head = 0
    else
      @head += 1
    end
    return x
  end

  def isEmpty?
    return @head == @tail
  end

  def isFull?
    return @head == (@tail + 1) % @queue.size
  end
end

queue = Queue.new(n + 1)
time = 0

(0...n).each do |i|
  queue.enqueue(arr[i])
end

while !queue.isEmpty?
  process = queue.dequeue
  if process[1].to_i > q
    process[1] = process[1].to_i - q
    time += q
    queue.enqueue(process)
  else
    time += process[1].to_i
    print "#{process[0]} #{time}\n"
  end
end
