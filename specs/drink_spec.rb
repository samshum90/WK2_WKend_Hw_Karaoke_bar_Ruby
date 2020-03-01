require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../drink')


class TestDrink < Minitest::Test

  def setup
    @beer = Drink.new("Beer", 5)
  end

  def test_drink()
    assert_equal("Beer", @beer.name)
    assert_equal(5, @beer.price)
  end
end
