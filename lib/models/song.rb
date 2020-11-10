require "tty-prompt"

class Song < ActiveRecord::Base
    has_many :users, through: :playlistsong
    @@prompt = TTY::Prompt.new
    
    def self.songs_menu
        system ('clear')
        choices = { 
            "Title" => 1,
            "Artist" => 2,
            "Genre" => 3
        }
        action = @@prompt.select("Search by:", choices)
        case action
    
        when 1
            title = @@prompt.ask("Title of song?")
            songs = Song.all.select {|s| s.title == title}
            puts songs.map {|s| [s.title, s.preview_url]}
        when 2
            artist = @@prompt.ask("Artist of song?")
            songs = Song.all.select {|s| s.artist == artist}
            puts songs.map {|s| [s.title, s.preview_url]}
        when 3
            genre = @@prompt.ask("Genre of song?")
            songs = Song.all.select {|s| s.genre == genre}
            puts songs.map {|s| [s.title, s.preview_url]}
    
        end
        
       end
end
