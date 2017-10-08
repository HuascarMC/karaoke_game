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

  def check_in_guest(name, waiting_room)
    guest = waiting_room.call_guest(name)
    if (guest.name == name) && (guest.money > 25)
      @guests << guest
      waiting_room.remove_guest(name)
      @till += 25
    else
      return "Not enough founds"
    end
  end

  def check_out_guest(name)
    for guest in @guests
      if guest.name == name
        @guests.delete(guest)
      end
    end
  end

  def add_song(name, author, songs)
    for song in songs
      if (song.name == name) && (song.author == author)
        @playlist << song
      end
    end
  end

end
