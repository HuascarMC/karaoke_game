require_relative('../karaoke.rb')
require_relative('../room.rb')
require_relative('../waiting_room.rb')
require_relative('../song.rb')
require_relative('../guests.rb')
require_relative('../bar.rb')
require('minitest/autorun')
require('minitest/rg')

class TestKaraoke < MiniTest::Test
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


end
