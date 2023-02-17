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
    shift_events
    @minute_count += amount
    @hour_count += amount
  end

  def minute_count; end

  def hour_count; end

  def shift_events; end

  private

  def now
    Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end
end
