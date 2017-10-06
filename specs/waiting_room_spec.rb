require_relative('../waiting_room')
require_relative('../guests.rb')
require('minitest/autorun')
require('minitest/rg')

class TestWaitingRoom < MiniTest::Test
  def setup
    @guest_1 = Guest.new("Andre", 100, @song01)
    @guest_2 = Guest.new("Miguel", 100, @song02)
    @guest_3 = Guest.new("Dan", 20, @song03)

    @queue = [@guest_1, @guest_2]

    @waiting_room = WaitingRoom.new(@queue)
  end

  def test_queue_count
    assert_equal(2, @waiting_room.queue_count())
  end

  def test_call_guest_name
    assert_equal(@guest_2, @waiting_room.call_guest("Miguel"))
  end

end
