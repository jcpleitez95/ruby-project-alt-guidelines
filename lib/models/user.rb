require "tty-prompt"

class User < ActiveRecord::Base
    has_many :playlists
    @@prompt = TTY::Prompt.new

    def initialize (create_playlist)
        @create_playlist = create_playlist
    end

    def self.signup
        username = @@prompt.ask("What is your name?")
        password = @@prompt.mask("What is your password?")
        age = @@prompt.ask("How old are you?")
        email = @@prompt.ask("What is your email address?")
        User.create(name: username, password: password, age: age, email: email)
        User.login
    end

    def self.login
        username = @@prompt.ask("What is your name?")
        password = @@prompt.mask("What is your password?")
        @user = User.find_by(name: username, password: password)
        if @user
            # self.display_menu
            system ('clear')
            CLI.main_menu
        else 
            puts "Unknown User or Password"
            sleep(1)
            system ('clear')
            CLI.login_menu
        end
    end

    # def create_playlist(name)
    #     Playlist.create(user_id: self.id, name: name)
    # end

    def self.create_new_playlist
        system ('clear')
        name = @@prompt.ask("What is the Playlist name? ")
        Playlist.create()

    end
end



