class Room

  attr_reader :name, :room_capacity, :hourly_fee
  attr_accessor :song_selection, :guests, :song_timer
  def initialize(name, room_capacity, hourly_fee)
    @name = name
    @room_capacity = room_capacity
    @hourly_fee = hourly_fee
    @song_selection = []
    @guests = []
    @song_timer = 0
  end

  def song_selection_count
    return @song_selection.count
  end

  def put_song_into_room(song)
    @song_selection << song
    @song_timer += song.duration
  end

  def selecting_song_limit(song)
    if @song_timer < 230
      put_song_into_room(song)
    else
      return "you have reached your limit on songs. Are you sure you want to continue?"
    end
  end

  def song_duration_sum
    result = @song_selection.map { |song| song.duration }
    return result.sum
  end

  def guest_count
    return @guests.count
  end

  def put_guest_into_room(guest)
    @guests << guest
  end

  def can_afford_entry(guest)
    if guest.wallet >= @hourly_fee
      return true
    else
      return false
    end
  end

  def decrease_wallet(guest)
    guest.wallet -= @hourly_fee
  end

  def collect_entry_fee(guest)
    if can_afford_entry(guest) == true
      decrease_wallet(guest)
    else
      return "Sorry, you can't afford this room, please select another room."
    end
  end

  def check_in(guest)
    if @guests.count < @room_capacity && can_afford_entry(guest)
      put_guest_into_room(guest)
      collect_entry_fee(guest)
    elsif @guests.count >= @room_capacity
      return "Sorry, room is already full, please select another room."
    elsif !can_afford_entry(guest)
      return "Sorry, you can't afford this room, please select another room."
    else
    end
  end



end
