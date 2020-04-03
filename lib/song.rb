require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.find_by_name(name)
    Song.all.find do |song|
    song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else self.create_by_name(name)
    end
  end

  def self.alphabetical
    Song.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(name)
    first_split = name.split(" - ")
    artist = first_split[0]
    song_format = first_split[1]
    #split_song_format = song_format.split(".")
    song = song_format.split(".")[0]

    new_song = Song.new_by_name(song)
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(name)
    new_song = Song.new_from_filename(name)
    new_song.save
  end

  def self.destroy_all
    Song.all.clear
  end

end

song = Song.new_from_filename("Thundercat - For Love I Come.mp3")

#binding.pry
