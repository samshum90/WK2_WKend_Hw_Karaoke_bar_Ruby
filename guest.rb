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

  # def check_favourite_song(songs)
  #   return "Woo! I love this song!" if songs.include?(@song) == true
  # end

end
