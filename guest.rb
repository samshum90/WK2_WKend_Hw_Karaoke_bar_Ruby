class Guest
attr_reader :name, :age, :favourite_song
attr_accessor :wallet, :bar_tab
  def initialize(name, age, wallet, favourite_song)
    @name = name
    @age = age
    @wallet = wallet
    @favourite_song = favourite_song
    @bar_tab = 0
  end

  def can_afford_drink(drink)
    return @wallet >= drink.price + @bar_tab
  end

  def buy_drink(drink, bar)
    if @age > 17
      if can_afford_drink(drink)
        @bar_tab += drink.price
        bar.sell_drink(drink, self)
      else
        return "Sorry you can't afford this"
      end
    else
      return "you're not old enough, mate"
    end
  end

  def paying_bar_tab()
    @wallet -= @bar_tab
    @bar_tab = 0
  end

end
