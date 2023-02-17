# frozen_string_literal: true

class HourMinuteCounter # :nodoc:
  Event = Struct.new(:amount, :time)

  def initialize
    @events = []
  end

  def add(amount)
    @events.push(Event.new(amount, now))
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
    @events.reverse_each do |event|
      break if event.time <= cutoff

      count += event.amount
    end

    count
  end
end
