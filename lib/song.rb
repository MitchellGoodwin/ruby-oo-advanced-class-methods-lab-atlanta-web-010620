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
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    self.all << song
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
      return self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    filename = filename.split(" - ")
    song = Song.new
    song.name = filename[1].delete_suffix(".mp3")
    song.artist_name = filename[0]
    song
  end

  def self.create_from_filename(filename)
    filename = filename.split(" - ")
    song = Song.create
    song.name = filename[1].delete_suffix(".mp3")
    song.artist_name = filename[0]
    song
  end

  def self.destroy_all
    @@all = []
  end

end
