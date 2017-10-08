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

  def test_karaoke
    puts "Choose between Miguel, Andre, Dan."
    puts "Welcome to CCC, what's your name?"
      name = gets.chomp.capitalize

    puts "Would you like to join a room, #{name}?"
      answer_1 = gets.chomp

    if answer_1 == "yes"
      @room01.check_in_guest(name, @waiting_room)
      if @room01.guests.count > 0

        puts "Great!"
        puts "What song would you like to sing?"
            song = gets.chomp
        puts "Who's the author?"
            author = gets.chomp

            @room01.add_song(song, author, @pop_songs)
            @room01.guest_favorite_song()


        puts "Would you like to buy a drink?"
          answer_3 = gets.chomp

        if answer_3 == "yes"
          puts "We have vodka, beer, tequila and rum."
          # answer_2 = gets.chomp
          #   if answer_2 == "yes"
              @room01.buys_drink(name, @bar)
        else
          puts "Keep singing."
          # end
        end
          puts "Sing along"
          sing = gets.chomp.upcase
          puts "#{name} grabs microphone and sings: "
          puts sing + "!!!!!!!!!!"
      end
    else
      puts "You can hang out then."
    end
  end
end
