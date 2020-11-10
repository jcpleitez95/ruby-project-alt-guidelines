require 'pry'
# require 'rest-client'
require 'json'
require 'rspotify'

RSpotify.authenticate("c95094077b534f878a9eeb73a36f8f0d", "32f89fc427dd464d9ce07e74fcf5c370")


def search_artist(name)
    artist = RSpotify::Artist.search(name)
    result = artist.first
end

jb = search_artist("Justin Bieber").top_tracks(:US)




binding.pry