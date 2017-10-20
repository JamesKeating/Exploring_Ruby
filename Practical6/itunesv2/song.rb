#!/usr/bin/ruby -w
# SONG
# Copyright Mark Keane, All Rights Reserved, 2014


# Class that encodes details of a song.
class Song
	include Pred
	attr_accessor :name, :album, :artist, :time, :owners, :id
	def initialize(name, album, artist, time, owners, id)
		@name = name
		@album = album
		@time = time
		@artist = artist
		@owners = owners
		@id = id
	end

	def to_s
		puts "<< #{@name} >> by #{@artist} in their album #{@album} is owed by #{@owners} .\n"
	end

	def play_song
		no = rand(10)
		no.times {print "#{@name} do be do..."}
		puts "\n"
	end
end
