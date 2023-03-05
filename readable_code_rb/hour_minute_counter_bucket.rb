# frozen_string_literal: true

class HourMinuteCounterBucket # :nodoc:
  Event = Struct.new(:amount, :time)

  class TrailingBucketCounter # :nodoc:
    class ConveyorQueue # :nodoc:
      def initialize(max_items)
        @max_items = max_items
        @total_sum = 0
        @q = []
      end

      def add_to_back(count)
        shift(1) if @q.empty?
        @q[-1] += count
        @total_sum += count
      end

      def shift(num_shifted)
        if num_shifted >= @max_items
          @q = []
          @total_sum = 0
          return
        end

        while num_shifted.positive?
          @q.push(0)
          num_shifted -= 1
        end

        @total_sum -= @q.pop while @q.size > @max_items
      end

      attr_reader :total_sum
    end

    def initialize(bucket_size, secs_per_bucket, now)
      @buckets = ConveyorQueue.new(bucket_size)
      @secs_per_bucket = secs_per_bucket
      @last_update_time = now
    end

    def add(count, now)
      update(now)
      @buckets.add_to_back(count)
    end

    def trailing_count(now)
      update(now)
      @buckets.total_sum
    end

    private

    def update(now)
      current_bucket = now / @secs_per_bucket
      last_update_bucket = @last_update_time / @secs_per_bucket
      @buckets.shift(current_bucket - last_update_bucket)
      @last_update_time = now
    end
  end

  def initialize
    now = now()
    @minute_counts = TrailingBucketCounter.new(60, 1, now)
    @hour_counts = TrailingBucketCounter.new(60, 60, now)
  end

  def add(count)
    now = now()
    @minute_counts.add(count, now)
    @hour_counts.add(count, now)
    self
  end

  def minute_count
    @minute_counts.trailing_count(now)
  end

  def hour_count
    @hour_counts.trailing_count(now)
  end

  def now
    Process.clock_gettime(Process::CLOCK_MONOTONIC).to_i
  end
end
