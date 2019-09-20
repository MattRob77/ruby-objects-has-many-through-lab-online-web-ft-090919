class Artist 
  attr_reader :name 
  
  @@all = [] 
  
  def initialize 
    @name = name 
    @@all << self 
  end 
  
  def self.all 
    @@all
  end 
  
  def songs 
    Song.all.select  {|song| song.artist == self}
  end 
  
  def new_song(name, genre)
    song = Song.new(name, self, genre)
    @@all << song
    song
  end

  def genres
    songs.map {|song| song.genre}
  end
end 