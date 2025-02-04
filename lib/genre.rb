class Genre
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
  
  def save
    @@all << self
  end
  
  def self.create(name)
    genre=Genre.new(name)
    genre.save
    genre
  end
  
  
  def add_song(song)
    song.genre = self unless song.genre == self
    @songs << song unless @songs.include?(song)
    
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all=[]
  end
  
  def artists
    artists = @songs.collect do |song|
      song.artist
    end
    artists.uniq
  end
  
end