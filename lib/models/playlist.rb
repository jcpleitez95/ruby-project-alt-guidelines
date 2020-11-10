class Playlist < ActiveRecord::Base
    has_many :songs, through: :playlistsong
    belongs_to :user
end
