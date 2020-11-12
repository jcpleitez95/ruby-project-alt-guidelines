require "tty-prompt"

class User < ActiveRecord::Base
    has_many :playlists
    @@prompt = TTY::Prompt.new

    def initialize (create_playlist)
        @create_playlist = create_playlist
    end
    
    def playlists
        Playlist.all.select {|p| p.user_id == self.id}
    end

    def add_song_to_playlist(playlist, song)
        Playlistsong.create(playlist_id: playlist, song_id: song)
    end

end



