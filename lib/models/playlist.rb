require "tty-prompt"

class Playlist < ActiveRecord::Base
    has_many :songs, through: :playlistsongs
    belongs_to :user
    @@prompt = TTY::Prompt.new
    
    # def initialize(create_new_playlist)
    #     # @create_playlist = create_playlist
    #     @create_new_playlist = create_new_playlist
    # end
  
    # def add(add_song)
    #     add_song.each do |song|
    #         @player_list << song
    #     end
    # end
    # def self.create_playlist(name)
    #     Playlist.create(self, name)
    # end

    # def create_new_playlist
    #     system ('clear')
    #     name = @@prompt.ask("What is the Playlist name? ")
    #     Playlist.create(user_id: self, name: name)
    # end
end