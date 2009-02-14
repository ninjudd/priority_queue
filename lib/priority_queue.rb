class PriorityQueue
  include Enumerable

  def initialize
    @queues = Hash.new do |hash, key|
      hash[key] = []
    end
  end

  def [](value)
    @queues[value]
  end

  def shift
    @queues.keys.sort.each do |key|
      if @queues[key].any?
        return @queues[key].shift
      else
        @queues.delete(key)
      end
    end
    nil
  end

  def each
    @queues.keys.sort.each do |key|
      @queues[key].each do |item|
        yield item
      end
    end
  end

  def size
    @queues.values.inject(0) do |size, queue|
      size + queue.size
    end
  end
end
