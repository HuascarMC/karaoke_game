class WaitingRoom
  attr_accessor :queue

  def initialize(queue)
    @queue = queue
  end

  def queue_count
    @queue.count
  end

  def call_guest(name)
    for guest in @queue
      if guest.name == name
        return guest
      end
    end
  end

  def remove_guest(name)
    guest = call_guest(name)
    @queue.delete(guest)
  end

end
