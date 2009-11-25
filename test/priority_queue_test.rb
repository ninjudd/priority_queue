require File.dirname(__FILE__) + '/test_helper'

class PriorityQueueTest < Test::Unit::TestCase
  should "shift values in priority order" do
    pq = PriorityQueue.new
    
    pq[1] << :important_foo
    pq[1] << :important_bar
    pq[0] << :very_important_foo
    pq[4] << :foo
    pq[4] << :bar

    assert_equal :very_important_foo, pq.shift
    assert_equal :important_foo,      pq.shift
    assert_equal :important_bar,      pq.shift
    assert_equal :foo,                pq.shift
    assert_equal :bar,                pq.shift
    assert_equal nil,                 pq.shift
    assert_equal nil,                 pq.shift
  end

  should "know it's own size" do
    pq = PriorityQueue.new

    pq[7] << :foo
    pq[7] << :fu
    pq[4] << :bar
    pq[9] << :baz
    pq[1] << :bap
    pq[0] << :zap

    assert_equal 6, pq.size
    
    3.times { pq.shift }
    assert_equal 3, pq.size

    3.times { pq.shift }
    assert_equal 0, pq.size

    3.times { pq.shift }
    assert_equal 0, pq.size
  end
end
