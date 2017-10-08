require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../guests.rb')
require_relative('../waiting_room.rb')
require_relative('../bar.rb')
require('minitest/autorun')
require('minitest/rg')

class TestRooms < MiniTest::Test
  def setup
    @guest_1 = Guest.new("Andre", 100, @song01)
    @guest_2 = Guest.new("Miguel", 100, @song02)
    @guest_3 = Guest.new("Dan", 20, @song03)

    @song01 = Song.new("Theme song", "Family Guy")
    @song02 = Song.new("Dancing Queen", "ABBA")
    @song03 = Song.new("Disco", "Discoman")
    @pop_songs = [@song01, @song02]

    @queue = [@guest_1, @guest_2, @guest_3]
    @waiting_room = WaitingRoom.new(@queue)

    @bar = Bar.new()

    @room01 = Room.new()
  end

  def test_room_guest_count
    assert_equal(0, @room01.guest_count())
  end

  def test_room_playlist_count
    assert_equal(0, @room01.playlist_count())
  end

  def test_check_in_guest_by_name
    @room01.check_in_guest("Miguel", @waiting_room)
    assert_equal(2, @waiting_room.queue_count)
    assert_equal(1, @room01.guest_count)
  end

  def test_not_enough_funds
    result = @room01.check_in_guest("Dan", @waiting_room)
    assert("Not enough funds", result)
  end

  def test_check_out_guest_by_name
    @room01.check_in_guest("Andre", @waiting_room)
    @room01.check_out_guest("Andre")
    assert_equal(0, @room01.guest_count)
  end

  def test_add_song_to_room
    @room01.add_song("Theme song", "Family Guy", @pop_songs)
    assert_equal(1, @room01.playlist_count)
  end

  def test_room_is_full
    @room01.check_in_guest("Miguel", @waiting_room)
    @room01.check_in_guest("Andre", @waiting_room)
    result = @room01.room_is_full()
    assert_equal("Room is full", result)
  end

  def test_guest_favorite_song
    @room01.add_song("Theme song", "Family Guy", @pop_songs)
    @room01.check_in_guest("Andre", @waiting_room)
    result = @room01.guest_favorite_song()
    assert_equal("Whoo!", result)
  end

  def test_guest_buys_drink
    @room01.check_in_guest("Andre", @waiting_room)
    @room01.buys_drink("Andre", @bar)
  end
end
