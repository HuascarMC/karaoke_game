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

  def room_is_full
    if @guests.count == 2
      puts "Room is full"
    end
      puts "Go in"
  end

  def guest_favorite_song
    for guest in @guests
      for song in @playlist
        if guest.song == song
        end
      end
      puts "Whoo!"
      return "Whoo!"
    end
  end

  def call_guest(name)
    for guest in @guests
      if guest.name == name
        return guest
      end
    end
  end

  def buys_drink(name, bar)
    this_guest = call_guest(name)
    puts "What would you like to drink?"
    drink = gets.chomp
    if drink == "tequila" || drink == "beer" || drink == "rum" || drink == "vodka"
      this_guest.money = (this_guest.money)-(bar.drinks[drink.to_sym])
      bar.till += bar.drinks[drink.to_sym]
      bar.drinks_sold += 1
      puts "Your remaining balance is $#{this_guest.money}."
    else
      puts "Sorry, not in stock."
    end
  end
end
