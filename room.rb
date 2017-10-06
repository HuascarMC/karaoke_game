class Room
  attr_accessor :guests, :playlist, :waiting_room

  def initialize
    @guests = []
    @playlist = []
    @till = 0
  end


end
