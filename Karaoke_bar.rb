class Karaoke_bar

attr_reader :name
attr_accessor :till, :guests, :room

  def initialize(name, till)
    @name = name
    @till = till
    @room = room
    @guests = guests
  end

  def add_money_to_till(room)
    @till + room.hourly_fee
  end

  def check_in_with_till(room, guest)
    room.check_in(guest)
    add_money_to_till(room)
  end

end
