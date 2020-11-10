class Song < ActiveRecord::Base
    has_many :users, through: :playlistsong
    
    
end
