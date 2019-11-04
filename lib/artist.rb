 class Artist
  
  extend Concerns::Findable
  
  attr_accessor :name
  @@all=[]
  def initialize(name)
    @name=name
    @songs=[]
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
    
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    artist=Artist.new(name)
    artist.save
    artist
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all=[]
  end
  
  def genres
    genres = @songs.collect do |song|
      song.genre
    end
    genres.uniq
  end
  
end