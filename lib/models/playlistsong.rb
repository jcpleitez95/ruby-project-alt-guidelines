class Playlistsong < ActiveRecord::Base
    belongs_to :playlist
    belongs_to :songs
end
