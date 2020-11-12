require "tty-prompt"

class Playlist < ActiveRecord::Base
    has_many :songs, through: :playlistsongs
    belongs_to :user
    @@prompt = TTY::Prompt.new


    def songs
        p = Playlistsong.all.select {|p| p.playlist_id == self.id}
        id = p.map(&:song_id)
    end

    def song_names
        
    end

    def add_song_to_playlist(song)
        Playlistsong.create(playlist_id: self.id, song_id: song)
    end

    def remove_song(song)

    end
end
