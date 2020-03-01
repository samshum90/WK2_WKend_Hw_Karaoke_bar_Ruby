class Karaoke_bar

attr_reader :name
attr_accessor :till, :guests, :room, :drink, :drink_stock

  def initialize(name, till)
    @name = name
    @till = till
    @room = room
    @guests = guests
    @drink_stock = []
  end

  def add_money_to_till(room)
    @till + room.hourly_fee
  end

  def check_in_with_till(room, guest)
    room.check_in(guest)
    add_money_to_till(room)
  end

  def add_drink_stock(drink)
    @drink_stock << drink
  end

  def sell_drink(drink, guest)
    return "That will be £#{drink.price}, please #{guest.name}"
  end

  def add_bar_tab_to_till(guest)
    @till += guest.bar_tab
  end

  def settle_bar_tab(guest)
    add_bar_tab_to_till(guest)
    guest.paying_bar_tab()
  end

end
