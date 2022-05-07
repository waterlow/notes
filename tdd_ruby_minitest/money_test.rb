# frozen_string_literal:true

require 'minitest/autorun'

module MoneyFactory # rubocop:disable Style/Documentation
  def dollar(amount)
    Money.new(amount, 'USD')
  end

  def franc(amount)
    Money.new(amount, 'CHF')
  end
end

# 変数をプライベートにしたい場合はclassをつかうこと
Money = Struct.new(:amount, :currency) do
  include MoneyFactory

  def times(multiplier)
    # self.class.newという記法が使えるので書籍よりも手前で完全にdとfのクラスが一致する
    self.class.new(amount * multiplier, currency)
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
    assert_equal('USD', dollar(nil).currency)
    assert_equal('CHF', franc(nil).currency)
  end
end
