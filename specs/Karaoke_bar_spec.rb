require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../karaoke_bar')
require_relative('../song')
require_relative('../room')
require_relative('../guest')

class TestKaraoke_bar < Minitest::Test

  def setup
    @sing_city = Karaoke_bar.new("Sing City", 100)

    @japan = Room.new("Tokyo", 6, 30)
    @france = Room.new("Paris", 4, 20)
    @south_korea = Room.new("Seoul", 8, 40)

    @guest1 = Guest.new("Andre", 36, 100, @marry_you)
    @guest2 = Guest.new("Amy", 16, 30, "Someone You Love")
    @guest3 = Guest.new("Paul", 25, 10, "Brightside")
  end

  def test_karaoke_bar()
    assert_equal("Sing City", @sing_city.name)
    assert_equal(100, @sing_city.till)
  end

  def test_can_afford_entry()
    assert_equal(true, @japan.can_afford_entry(@guest1))
  end

  def test_cannot_afford_entry()
    assert_equal(false, @japan.can_afford_entry(@guest3))
  end

  def test_collect_entry_fee()
      assert_equal(70, @japan.decrease_wallet(@guest1))
    end

  def test_collect_entry_fee()
      assert_equal(70, @japan.collect_entry_fee(@guest1))
    end

  def test_deny_entry_fee()
      assert_equal("Sorry, you can't afford this room, please select another room.", @japan.collect_entry_fee(@guest3))
    end

  def test_check_in()
    @japan.check_in(@guest1)
    assert_equal(1,@japan.guest_count)
  end

  def test_check_in_over_capacity()
    @japan.put_guest_into_room(@guest1)
    @japan.put_guest_into_room(@guest1)
    @japan.put_guest_into_room(@guest1)
    @japan.put_guest_into_room(@guest1)
    @japan.put_guest_into_room(@guest1)
    @japan.put_guest_into_room(@guest1)
    @japan.put_guest_into_room(@guest1)
    @japan.put_guest_into_room(@guest1)
    @japan.put_guest_into_room(@guest1)
    @japan.put_guest_into_room(@guest1)
    assert_equal("Sorry, room is already full, please select another room.", @japan.check_in(@guest1))
  end

  def test_check_in_cannot_afford()
    assert_equal("Sorry, you can't afford this room, please select another room.",@japan.check_in(@guest3))
  end

  def test_add_money_to_till()
    assert_equal(130, @sing_city.add_money_to_till(@japan))
  end

  def test_check_in_with_till()
    # @japan.check_in(@guest1)
    # add_money_to_till(@japan)
    assert_equal(130, @sing_city.check_in_with_till(@japan, @guest1))
  end


end
