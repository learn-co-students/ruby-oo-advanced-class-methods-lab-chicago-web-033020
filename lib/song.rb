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
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    # song.name = name
    # self.create <<<< failed attempt at DRYing out this code. 
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
   self.all.sort_by! {|song| song.name}
  end

  def self.new_from_filename(title)
    song = self.new
    song.name = (title.split(" - ")[1].chomp(".mp3")) # splits the title with "-", then takes the [1] index and chomps the end (the .mp3)
    song.artist_name = (title.split(" - ")[0]) # splits the title at the "-" and returns the [0]
    song
  end

  def self.create_from_filename(title)
    # self.new_from_filename(title)
    @@all << self.new_from_filename(title)
  end

  def self.destroy_all

    @@all.clear
    

  end


end
# binding.pry


