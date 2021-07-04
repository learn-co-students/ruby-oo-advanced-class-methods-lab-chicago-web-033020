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

  def self.song_from_filename(name)
    name.split(" - ")[1].split(".")[0]
  end

  def self.artist_from_filename(name)
    name.split(" - ")[0]
  end

  def self.new_from_filename(name)
    new_song = Song.new_by_name(Song.song_from_filename(name))
    new_song.artist_name = Song.artist_from_filename(name)
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