require "tty-prompt"

class Song < ActiveRecord::Base
    has_many :playlists, through: :playlistsong
    @@prompt = TTY::Prompt.new
    
    def playlists
        p = Playlistsong.all.select {|p| p.song_id == self.id}
        p.map(&:playlist_id)
    end

  
end
