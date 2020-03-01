require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest')
require_relative('../song')

class TestGuest < Minitest::Test

  def setup()
    @guest1 = Guest.new("Andre", 35, 100, @marry_you)

    @marry_you = Song.new("Marry You", "Bruno Mars", 230)
  end

  def test_guest()
    assert_equal("Andre", @guest1.name)
    assert_equal(35, @guest1.age)
    assert_equal(100, @guest1.wallet)
    assert_equal(@marry_you, @guest1.favourite_song)
  end

end
