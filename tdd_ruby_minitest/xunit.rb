# frozen_string_literal:true

class TestCase # rubocop:disable Style/Documentation
  def initialize(name)
    @name = name
  end

  def set_up; end

  def run
    set_up
    public_send(@name)
    tear_down
  end

  def tear_down; end

  def assert(bool)
    bool ? p('ok') : raise('assertion error')
  end
end

class WasRun < TestCase # rubocop:disable Style/Documentation
  attr_reader :log

  def test_method
    @log += 'test_method '
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
end

TestCaseTest.new('test_template_method').run
