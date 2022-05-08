# frozen_string_literal:true

require 'minitest/autorun'

module MoneyFactory # rubocop:disable Style/Documentation
  def dollar(amount)
    Money.new(amount, :USD)
  end

  def franc(amount)
    Money.new(amount, :CHF)
  end
end

# 変数をプライベートにしたい場合はclassをつかうこと
Money = Struct.new(:amount, :currency) do
  def times(multiplier)
    # self.class.newという記法が使えるので書籍よりも手前で完全にdとfのクラスが一致する
    self.class.new(amount * multiplier, currency)
  end

  def +(other)
    Sum.new(self, other)
  end

  def reduce(bank, to)
    Money.new(amount / bank.rate(currency, to), to)
  end
end

class Bank # rubocop:disable Style/Documentation
  def initialize
    @rates = {}
  end

  def reduce(sum, to)
    sum.reduce(self, to)
  end

  def add_rate(from, to, rate)
    @rates[[from, to]] = rate
  end

  def rate(from, to)
    from == to ? 1 : @rates[[from, to]]
  end
end

Sum = Struct.new(:augend, :addend) do
  def times(multiplier)
    Sum.new(augend.times(multiplier), addend.times(multiplier))
  end

  def reduce(bank, to)
    Money.new(augend.reduce(bank, to).amount + addend.reduce(bank, to).amount, to)
  end

  def +(other)
    Sum.new(self, other)
  end
end

class MoneyTest < Minitest::Test # rubocop:disable Style/Documentation
  include MoneyFactory

  def test_multiplication
    five = dollar(5)
    assert_equal(five.times(2), dollar(10))
    assert_equal(five.times(3), dollar(15))
  end

  def test_equality
    assert_equal(dollar(5), dollar(5))
    assert(dollar(5) != dollar(4))
    assert(dollar(5) != franc(5))
  end

  def test_currency
    assert_equal(:USD, dollar(nil).currency)
    assert_equal(:CHF, franc(nil).currency)
  end

  def test_simple_addition
    sum = dollar(5) + dollar(5)
    bank = Bank.new
    reduced = bank.reduce(sum, :USD)
    assert_equal(reduced, dollar(10))
  end

  def test_plus_returns_sum
    five = dollar(5)
    sum = five + five
    assert_equal(sum.augend, five)
    assert_equal(sum.addend, five)
  end

  def test_reduce_sum
    sum = Sum.new(dollar(3), dollar(4))
    bank = Bank.new
    result = bank.reduce(sum, :USD)
    assert_equal(result, dollar(7))
  end

  def test_reduce_money
    bank = Bank.new
    result = bank.reduce(dollar(1), :USD)
    assert_equal(result, dollar(1))
  end

  def test_reduce_money_different_currency
    bank = Bank.new
    bank.add_rate(:CHF, :USD, 2)
    result = bank.reduce(franc(2), :USD)
    assert_equal(result, dollar(1))
  end

  def test_mixed_addtion
    five_bucks = dollar(5)
    ten_francs = franc(10)
    bank = Bank.new
    bank.add_rate(:CHF, :USD, 2)
    result = bank.reduce(five_bucks + ten_francs, :USD)
    assert_equal(dollar(10), result)
  end

  def test_sum_plus_money
    five_bucks = dollar(5)
    ten_francs = franc(10)
    bank = Bank.new
    bank.add_rate(:CHF, :USD, 2)
    sum = Sum.new(five_bucks, ten_francs) + five_bucks
    result = bank.reduce(sum, :USD)
    assert_equal(dollar(15), result)
  end

  def test_sum_times
    five_bucks = dollar(5)
    ten_francs = franc(10)
    bank = Bank.new
    bank.add_rate(:CHF, :USD, 2)
    sum = Sum.new(five_bucks, ten_francs).times(2)
    result = bank.reduce(sum, :USD)
    assert_equal(dollar(20), result)
  end
end
