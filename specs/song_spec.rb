require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')

class TestSong < Minitest::Test
  def setup
    @marry_you = Song.new("Marry You", "Bruno Mars", 230)
  end

  def test_song
    assert_equal("Marry You", @marry_you.name)
    assert_equal("Bruno Mars", @marry_you.artist)
    assert_equal(230, @marry_you.duration)
  end
end
