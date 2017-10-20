#!/usr/bin/ruby -w
# iTUNES
# Copyright Mark Keane, All Rights Reserved, 2014

#This is the top level
require 'csv'
require_relative 'predicate'
require_relative 'actor'
require_relative 'album'
require_relative 'song'
require_relative 'reader'
require_relative 'utilities'
require_relative 'error'
require_relative 'data'


#songs_file = ARGV[0]                  #for command line
#owners_file = ARGV[1]                 #for command line


# ADDED BY STUDENT
# handles error when an id is not in both owners csv and songs by removing song.
def update_song_ownership(data)
  puts "Updating songs with ownership details..."
  data.songs.delete_if do |song|
    song.owners = data.hashes[song.id]

    if song.owners == nil
      puts "\nThe song "+ song.name + " does not have a matching id in the owners file." +
               "\nPlease check the IDs ("+song.id + ") for this song is correct. The song will be excluded from itunes for now.\n"
      true
    end
  end
end



reader = Reader.new
data = DataBit.new

songs_file = 'songs.csv'             #in RubyMine
owners_file = 'owners.csv'           #in RubyMine

puts "\nProcessing Songs from file: #{songs_file}"
data.songs = reader.read_in_songs(songs_file)

puts "Processing Ownership from file: #{owners_file}"
data.hashes = reader.read_in_ownership(owners_file)

puts "Building all owners..."
data.actors = Actor.build_all(data)

update_song_ownership(data)

puts "Building All Albums..."
data.albums = Album.build_all(data)

# Given the name of a song and a person; let them buy the song
puts "\nJamesk buys Homecoming..."
song1 = Util.fetch(data,"Homecoming")
james =   Util.fetch(data,"jamesk")
james.to_s
song1.to_s
james.buys_song(song1)
song1.to_s

# What songs does Markk own
puts "\nHow many songs does James own..."
p james.what_songs_does_he_own(data).size

puts "\nPlay The Homecoming..."
song1.play_song

# Print out all songs
puts "\nPrinting full details of all songs..."
data.songs.each{|song| p song}

puts "\nPrinting full details of all Albums..."
data.albums.each{|album| p album}
# Call it like this in the command line.
# markkean% ruby itunes.rb songs.csv owners.csv


