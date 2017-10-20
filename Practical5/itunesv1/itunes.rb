#!/usr/bin/ruby -w
# iTUNES
# Copyright Mark Keane, All Rights Reserved, 2014

#This is the top level
require 'csv'
require_relative 'actor'
require_relative 'album'
require_relative 'song'
require_relative 'reader'
require_relative 'utilities'
require_relative 'error'

#songs_file = ARGV[0]                  #for command line
#owners_file = ARGV[1]                 #for command line


# ADDED BY STUDENT
# handles error when an id is not in both owners csv and songs by removing song.
def update_song_ownership
  puts "Updating songs with ownership details..."
  $songs.delete_if do |song|
    song.owners = $hash_owners[song.id]

    if song.owners == nil
      puts "\nThe song "+ song.name + " does not have a matching id in the owners file." +
               "\nPlease check the IDs ("+song.id + ") for this song is correct. The song will be excluded from itunes for now.\n"
      true
    end
  end
end


reader = Reader.new
songs_file = 'songs.csv'             #in RubyMine
owners_file = 'owners.csv'           #in RubyMine

puts "\nProcessing Songs from file: #{songs_file}"
$songs = reader.read_in_songs(songs_file)

puts "Processing Ownership from file: #{owners_file}"
$hash_owners = reader.read_in_ownership(owners_file)

puts "Building all owners..."
$actors = Actor.build_all()

update_song_ownership

puts "Building All Albums..."
$albums = Album.build_all()

# Given the name of a song and a person; let them buy the song
puts "\nJamesk buys Homecoming..."
song1 = Util.fetch("Homecoming")
james =   Util.fetch("jamesk")
james.to_s
song1.to_s
james.buys_song(song1)
song1.to_s

# What songs does Markk own
puts "\nHow many songs does James own..."
p james.what_songs_does_he_own().size

puts "\nPlay The Homecoming..."
song1.play_song

# Print out all songs
puts "\nPrinting full details of all songs..."
$songs.each{|song| p song}

puts "\nPrinting full details of all Albums..."
$albums.each{|album| p album}
# Call it like this in the command line.
# markkean% ruby itunes.rb songs.csv owners.csv

