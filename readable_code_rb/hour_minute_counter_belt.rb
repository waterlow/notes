# frozen_string_literal: true

class HourMinuteCounterBelt # :nodoc:
  Event = Struct.new(:amount, :time)

  def initialize
    @minute_events = []
    @hour_events = []
    @minute_count = 0
    @hour_count = 0
  end

  def add(amount)
    @minute_events.push(Event.new(amount, now))
    shift_events(now)
    @minute_count += amount
    @hour_count += amount
    self
  end

  def minute_count
    shift_events(now)
    @minute_count
  end

  def hour_count
    shift_events(now)
    @hour_count
  end

  private

  def now
    Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end

  def shift_events(time)
    shift_minute_events(time)
    shift_hour_events(time)
  end

  def shift_minute_events(time)
    minute_ago = time - 60
    while @minute_events[0] && @minute_events[0].time <= minute_ago
      @hour_events.push(@minute_events[0])
      @minute_count -= @minute_events[0].amount
      @minute_events.shift
    end
  end

  def shift_hour_events(time)
    hour_ago = time - 3600
    while @hour_events[0] && @hour_events[0].time <= hour_ago
      @hour_count -= @hour_events[0].amount
      @hour_events.shift
    end
  end
end
