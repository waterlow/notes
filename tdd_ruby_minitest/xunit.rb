# frozen_string_literal:true

class TestCase # rubocop:disable Style/Documentation
  def initialize(name)
    @name = name
  end

  def set_up; end

  def run
    set_up
    public_send(@name)
  end

  def assert(bool)
    bool ? p('ok') : raise('assertion error')
  end
end

class WasRun < TestCase # rubocop:disable Style/Documentation
  attr_reader :was_run, :was_set_up

  def test_method
    @was_run = 1
  end

  def set_up
    @was_set_up = 1
  end
end

class TestCaseTest < TestCase # rubocop:disable Style/Documentation
  def set_up
    @test = WasRun.new('test_method')
  end

  def test_running
    test.run
    assert(test.was_run)
  end

  def test_set_up
    test.run
    assert(test.was_set_up)
  end

  private

  attr_reader :test
end

TestCaseTest.new('test_running').run
TestCaseTest.new('test_set_up').run
