# frozen_string_literal:true

class TestCase # rubocop:disable Style/Documentation
  def initialize(name)
    @name = name
  end

  def run
    public_send(@name)
  end
end

class WasRun < TestCase # rubocop:disable Style/Documentation
  attr_reader :was_run

  def test_method
    @was_run = 1
  end
end

class TestCaseTest < TestCase # rubocop:disable Style/Documentation
  def test_running
    test = WasRun.new('test_method')
    raise if test.was_run

    test.run
    raise unless test.was_run
  end
end

TestCaseTest.new('test_running').run
