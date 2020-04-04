require "pry"
require "yaml"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all.push(self)
  end

  # creates new instance of Song
  def self.create

    # instantiate. means same thing as create new
    song = self.new

    # push new song to @@all array
    song.save

    # call song to display newly created song
    song

  end

  # --- test ---
  # song = Song.create
  # Song.all.include?(song)

  # ---------------------------------------------------


  # set parameter to receive a song name
  def self.new_by_name(songName)

    # instantiate by assigning new instance to var
    song = self.new

    # basically means self.new.name = songName, just former is stored in var
    song.name = songName

    # call on object with added name
    song

  end

  # --- test ---
  # song = Song.new_by_name("The Middle")
  # puts song.to_yaml
  # Song.name

  # ---------------------------------------------------

  # set parameter to receive a song name
  def self.create_by_name(songName)

    # instantiate by using the create method to create instance
    song = self.create

    # assign appropriate variables
    song.name = songName

    # call to receive results
    song

  end

  # --- test ---
  # song = Song.create_by_name("Rockstar")
  # puts song.to_yaml
  # Song.all.include?(song)

  # ---------------------------------------------------

  def self.find_by_name(songName)
    self.all.find {|searchName| searchName.name == songName}
  end

  # --- test ---
  # paradise = Song.create_by_name("Paradise")
  # Song.find_by_name("Paradise")
  # puts Song.find_by_name("Paradise").to_yaml

  # ---------------------------------------------------

  def self.find_or_create_by_name(songName)
    self.find_by_name(songName) || self.create_by_name(songName)
  end

  def self.alphabetical
    self.all.sort_by {|nameHolder| nameHolder.name}
  end

  # ---------------------------------------------------

  def self.new_from_filename(fileName)
    # splits and creates an array containing the new values, assigns array to splitParts
    splitParts = fileName.split(" - ")

    # assigns artist/first index to var arist_name
    artist_name = splitParts[0]

    # gsub replaces ".mp3" with nothing - basically removes it
    # then stores result in songName
    songName = splitParts[1].gsub(".mp3", "")

    # create new
    song = self.new

    # assign proper variables
    song.name = songName

    # assign proper variables
    song.artist_name = artist_name

    # call to activate?
    song
  end

  # --- test ---
  # song = Song.new_from_filename("Billy Joel - Piano Man.mp3")
  # song.name
  # song.artist_name

  # ---------------------------------------------------


  def self.create_from_filename(fileName)
    parts = fileName.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end

binding.pry
