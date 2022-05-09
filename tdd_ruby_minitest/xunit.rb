# frozen_string_literal:true

class TestCase # rubocop:disable Style/Documentation
  def initialize(name)
    @name = name
  end

  def set_up; end

  def run
    result = TestResult.new
    result.test_started

    set_up
    public_send(@name)
    tear_down

    result
  end

  def tear_down; end

  def assert(bool)
    bool || raise('assertion error')
  end
end

class TestResult # rubocop:disable Style/Documentation
  def initialize
    @run_count = 0
    @error_count = 0
  end

  def test_started
    @run_count += 1
  end

  def test_finished
    @error_count += 1
  end

  def summary
    "#{@run_count} run, #{@error_count} failed"
  end
end

class WasRun < TestCase # rubocop:disable Style/Documentation
  attr_reader :log

  def test_method
    @log += 'test_method '
  end

  def test_broken_method
    raise
  end

  def set_up
    @log = 'set_up '
  end

  def tear_down
    @log += 'tear_down '
  end
end

class TestCaseTest < TestCase # rubocop:disable Style/Documentation
  def test_template_method
    test = WasRun.new('test_method')
    test.run
    assert(test.log == 'set_up test_method tear_down ')
  end

  def test_result
    test = WasRun.new('test_method')
    result = test.run
    assert(result.summary == '1 run, 0 failed')
  end

  def test_failed_result
    test = WasRun.new('test_broken_method')
    result = test.run
    assert(result.summary == '1 run, 1 failed')
  end

  def test_failed_result_formatting
    result = TestResult.new
    result.test_started
    result.test_finished
    assert(result.summary == '1 run, 1 failed')
  end
end

p TestCaseTest.new('test_template_method').run.summary
p TestCaseTest.new('test_result').run.summary
# TestCaseTest.new('test_failed_result').run
p TestCaseTest.new('test_failed_result_formatting').run.summary
