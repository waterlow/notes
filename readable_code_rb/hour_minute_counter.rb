# frozen_string_literal: true

class HourMinuteCounter # :nodoc:
  def initialize
    @events = []
  end

  def add(count)
    @events.push([count, now])
  end

  def minute_count
    count_since(now - 60)
  end

  def hour_count
    count_since(now - 3600)
  end

  private

  def now
    Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end

  def count_since(cutoff)
    count = 0
    @events.reverse_each do |c, time|
      break if time < cutoff

      count += c
    end

    count
  end
end
