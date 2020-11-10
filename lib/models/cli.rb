require 'tty-prompt'
require 'rspotify'
require 'json'
require 'pry'

class CLI

    @@prompt = TTY::Prompt.new
    @@user = nil

    def self.welcome
        system ('clear')
        puts "Welcome to New Muse, the new generation music player!"
    end

    def self.login_menu
        sleep(1.5)
        choices = { "Log In" => 1,
            "Sign Up" => 2
        }
        choice = @@prompt.select("Would you like to sign up or log in?", choices)
        if choice == 1
            User.login
        elsif choice == 2
            User.signup
        end
    end

    def self.main_menu
        system ('clear')
        choices = { 
            "View Playlists" => 1,
            "Create New Playlist" => 2,
            "Search for a song" => 3,
            "Play Random Song" => 4
        }

        action = @@prompt.select("What would you like to do?", choices)
        case action
        when 1 
            
        when 2
            User.create_new_playlist
        when 3
            Song.songs_menu
        when 4
            songs_array = Song.all.map { |s| [s.title, s.artist, s.genre, s.preview_url]}
            puts songs_array.sample
        end

    end




end


# class Playlist
#     def initialize(player_list)
#       @player_list = player_list
#     end
  
#     def add(add_song)
#         add_song.each do |song|
#             @player_list << song
#         end
#     end
# end

