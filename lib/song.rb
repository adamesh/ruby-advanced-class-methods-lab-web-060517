require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
  end

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
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(song_name)
    self.all.detect {|object| object.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    detected_song = self.find_by_name(song_name)
    if detected_song == nil
      self.create_by_name(song_name)
    else
      return detected_song
    end
  end

  def self.alphabetical
    self.all.sort { |a, b| a.name <=> b.name }
  end

  def self.new_from_filename(filename)
    split_filename = filename.split(/[-.]/)
    song_name = split_filename[1].strip
    artists_name = split_filename[0].strip
    #all stuff stripped by this line
    song_object = self.create_by_name(song_name)
    song_object.artist_name = artists_name
    song_object
  end

  def self.create_from_filename(filename)
    object = self.new_from_filename(filename)
    object.save
  end

  def self.destroy_all
    self.all.clear
  end


end
