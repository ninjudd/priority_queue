class PriorityQueue
  include Enumerable

  def initialize
    @queues = {}
  end

  def [](value)
    @queues[value] ||= []
  end

  def priorities
    @queues.keys.sort
  end

  def shift
    priorities.each do |key|
      if self[key].any?
        return self[key].shift
      else
        @queues.delete(key)
      end
    end
    nil
  end

  def each
    priorities.each do |key|
      self[key].each do |item|
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
