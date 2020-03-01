require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest')
require_relative('../song')
require_relative('../drink')
require_relative('../karaoke_bar')

class TestGuest < Minitest::Test

  def setup()
    @sing_city = Karaoke_bar.new("Sing City", 100)

    @guest1 = Guest.new("Andre", 35, 100, "Marry You")
    @guest2 = Guest.new("Amy", 16, 10, "Someone You Love")
    @guest3 = Guest.new("Paul", 25, 10, "Brightside")

    @marry_you = Song.new("Marry You", "Bruno Mars", 230)

    @beer = Drink.new("Beer", 5)
    @wine = Drink.new("Wine", 20)
    @cider = Drink.new("cider", 10)
  end

  def test_guest()
    assert_equal("Andre", @guest1.name)
    assert_equal(35, @guest1.age)
    assert_equal(100, @guest1.wallet)
    assert_equal("Marry You", @guest1.favourite_song)
  end

  def test_can_afford_drink()
    assert_equal(true, @guest1.can_afford_drink(@beer))
  end

  def test_cannot_afford_drink()
    assert_equal(false, @guest2.can_afford_drink(@wine))
  end

  def test_can_buy_drink()
    assert_equal("That will be £5, please Andre", @guest1.buy_drink(@beer, @sing_city))
  end

  def test_can_buy_drink_bar_tab()
    @guest1.buy_drink(@beer, @sing_city)
    assert_equal(5, @guest1.bar_tab)
  end

  def test_can_buy_drink_cannot_afford()
    assert_equal("Sorry you can't afford this", @guest3.buy_drink(@wine,@sing_city))
  end

  def test_can_buy_drink_under_age()
    assert_equal("you're not old enough, mate", @guest2.buy_drink(@beer, @sing_city))
  end

  def test_paying_bar_tab()
    @guest1.buy_drink(@beer, @sing_city)
    @guest1.paying_bar_tab()
    assert_equal(95, @guest1.wallet)
    assert_equal(0, @guest1.bar_tab)
  end



end
