require 'tty-prompt'
require 'tty-font'
require 'rspotify'
require 'json'
require 'pry'

class CLI

    attr_accessor :user, :playlist, :song, :playlistsong

    @@prompt = TTY::Prompt.new
    # @@artii = Artii::Base.new :font =>'standard'
    # @@user = nil

    def self.welcome
        system ('clear')
        font = TTY::Font.new(:doom)
        pastel = Pastel.new
        puts pastel.green(font.write("NewMuse"))
        # puts pastel.green(dumbbell)
        # puts @@artii.asciify("The new generation music player!")
    end

    def self.login_menu
        CLI.welcome
        choices = { "Log In" => 1,
            "Sign Up" => 2
        }
        choice = @@prompt.select("Would you like to sign up or log in?", choices)
        if choice == 1
            CLI.login
        elsif choice == 2
            CLI.signup
        end
    end

    def self.signup
        username = @@prompt.ask("What is your name?")
        password = @@prompt.mask("What is your password?")
        age = @@prompt.ask("How old are you?")
        email = @@prompt.ask("What is your email address?")
        puts "Welcome to New Muse!"
        sleep(2)
        @user = User.create(name: username, password: password, age: age, email: email)
        @user
        CLI.main_menu
    end

    def self.login
        username = @@prompt.ask("What is your name?")
        password = @@prompt.mask("What is your password?")
        if User.find_by(name: username, password: password)
            @user = User.find_by(name: username, password: password)
            @user
            CLI.main_menu
        else 
            puts "Unknown User or Password"
            sleep(1)
            system ('clear')
            CLI.login_menu
        end
    end


    def self.main_menu
        system ('clear')
        CLI.welcome
        choices = { 
            "View Playlists" => 1,
            "Create New Playlist" => 2,
            "Search Music" => 3,
            "I'm Feeling Adventurous" => 4,
            "Exit" => 5
        }

        action = @@prompt.select("What would you like to do?", choices)
        case action
        when 1 
            playlist = @user.playlists
            puts playlist.map(&:name)
            sleep (2)
            CLI.playlist_menu
        when 2
            name = @@prompt.ask("What will you name it?")
            Playlist.create(user_id: @user.id, name: name)
            puts "Playlist Created!"
            sleep (2)
            CLI.main_menu
        when 3
            CLI.songs_menu
        when 4
            @song = Song.all.sample
            puts @song.title
            puts @song.artist
            puts @song.preview_url
            CLI.random_song_menu
        when 5
            puts "See you soon!"
            sleep (2)
            exit
        end
        
    end

    def self.songs_menu
        system ('clear')
        choices = { 
            "Title" => 1,
            "Artist" => 2,
            "Genre" => 3,
            "Return to Main Menu" => 4
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
        when 4
            CLI.main_menu
        end
        CLI.add_song
    end

    def self.add_song
        choices = { 
            "Add Song to Playlist" => 1,
            "Return to Main Menu" => 2,
        }

        action = @@prompt.select("What now?", choices)
        case action
        when 1
            song = @@prompt.ask("Which Song?")
            playlist = @@prompt.ask("Which Playlist?")
            if Playlist.find_by(name: playlist) && Song.find_by(title: song)
                @playlist = Playlist.find_by(name: playlist)
                @song = Song.find_by(title: song)
                @playlist.add_song_to_playlist(@song.id)
            end
            CLI.add_song
        when 2
            CLI.main_menu
        end
    end

    def self.random_song_menu
        choices = { 
            "Add Song to Playlist" => 1,
            "Return to Main Menu" => 2,
        }

        action = @@prompt.select("What now?", choices)
        case action
        when 1
            playlist = @@prompt.ask("Which Playlist?")
            if Playlist.find_by(name: playlist)
                @playlist = Playlist.find_by(name: playlist)
                @playlist.add_song_to_playlist(@song.id)
            end
        when 2
            CLI.main_menu
        end
    end

    def self.playlist_menu
        choices = { 
            "View Playlist" => 1,
            "Delete Playlist" =>2,
            "Return to Main Menu" => 3,
        }

        action = @@prompt.select("What would you like to do?", choices)
        case action
        when 1
            playlist = @@prompt.ask("Which Playlist?")
            if Playlist.find_by(name: playlist)
                @playlist = Playlist.find_by(name: playlist)
                puts @playlist.songs
                CLI.playlist_sub_menu
            end
        when 2
            playlist = @@prompt.ask("Which Playlist?")
            if Playlist.find_by(name: playlist)
                @playlist = Playlist.find_by(name: playlist)
                @playlist.remove_playlist
                puts "Playlist Deleted!"
                sleep (2)
                CLI.playlist_menu
            end
        when 3
            CLI.main_menu
        end
    end

    def self.playlist_sub_menu
        choices = { 
            "Add Song to Playlist" => 1,
            "Delete Song from Playlist" => 2,
            "Return to Main Menu" => 3
        }

        action = @@prompt.select("What now?", choices)
        case action
        when 1
            title = @@prompt.ask("Which Song?")
            if Song.find_by(title: title)
                @song = Song.find_by(title: title)
                @playlist.add_song_to_playlist(@song.id)
                @playlist.songs
            end
        when 2
            title = @@prompt.ask("Which Song?")
            if Song.find_by(title: title)
                @song = Song.find_by(title: title)
                @playlist.remove_song(@song.id)
                @playlist.songs
            end
        when 3
            CLI.main_menu
        end
        CLI.playlist_sub_menu
    end


end




