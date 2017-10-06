class Room
  attr_accessor :guests, :playlist, :waiting_room

  def initialize
    @guests = []
    @playlist = []
    @till = 0
  end

  def guest_count()
    @guests.count
  end

  def playlist_count()
    @playlist.count
  end

end
