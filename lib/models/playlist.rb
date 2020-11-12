require "tty-prompt"

class Playlist < ActiveRecord::Base
    has_many :songs, through: :playlistsongs
    belongs_to :user
    @@prompt = TTY::Prompt.new


    def songs
        p = Playlistsong.all.select {|p| p.playlist_id == self.id}
        song_id = p.map(&:song_id)
        song = Song.where(id: song_id)
        list = song.map {|s| [s.title, s.artist, s.preview_url]}
        list
    end

    def add_song_to_playlist(song)
        Playlistsong.create(playlist_id: self.id, song_id: song)
    end

    def remove_song(song)
        Playlistsong.where(playlist_id: self.id, song_id: song).destroy_all
    end

    def remove_playlist
        self.destroy
    end
end
