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
            "View Playlist" => 1,
            "Create New Playlist" => 2,
            "Search for a song" => 3,
            "Play Random Song" => 4
        }


        case action
        when 1 
            
        when 2

            Playlist.create
        when 3

        when 4 

        when 5

        end

    end

    def my_playlists

    end



end

