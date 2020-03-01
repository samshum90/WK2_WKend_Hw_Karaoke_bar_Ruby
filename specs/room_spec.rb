require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../song')
require_relative('../guest')

class TestRoom < Minitest::Test

  def setup
    @japan = Room.new("Tokyo", 6, 30)

    @marry_you = Song.new("Marry You", "Bruno Mars", 230)
    @someoneyoulove = Song.new("Someone You Love", "Lewis Capaldi", 180)
    @brightside = Song.new("Mr Brightside", "The Killers", 220)

    @guest1 = Guest.new("Andre", 36, 100, @marry_you)
  end

  def test_room
    assert_equal("Tokyo", @japan.name)
    assert_equal(6, @japan.room_capacity)
    assert_equal(30, @japan.hourly_fee)
    assert_equal([], @japan.song_selection)
    assert_equal([], @japan.guests)
  end

  def test_put_song_into_room()
    @japan.put_song_into_room(@marry_you)
    assert_equal(1,@japan.song_selection_count)
    assert_equal(230,@japan.song_timer)
  end

  def test_song_duration_sum()
    @japan.put_song_into_room(@marry_you)
    @japan.put_song_into_room(@someoneyoulove)
    assert_equal(410, @japan.song_duration_sum)
  end

  def test_selecting_song_limit_fail()
    @japan.selecting_song_limit(@marry_you)
    assert_equal("you have reached your limit on songs. Are you sure you want to continue?", @japan.selecting_song_limit(@marry_you))
  end

  def test_put_guest_into_room()
    @japan.put_guest_into_room(@guest1)
    assert_equal(1,@japan.guest_count)
  end

  def test_check_favourite_song()
    @japan.put_song_into_room(@marry_you)
    assert_equal("Whooooo! I love this song!", @japan.check_favourite_song(@guest1))
  end

  def test_remove_guest_from_room()
    @japan.put_guest_into_room(@guest1)
    @japan.remove_guest_from_room(@guest1)
    assert_equal(0, @japan.guest_count)
  end


end
