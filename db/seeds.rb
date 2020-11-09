require 'pry'
# require 'rest-client'
require 'json'
require 'rspotify'

RSpotify.authenticate("c95094077b534f878a9eeb73a36f8f0d", "32f89fc427dd464d9ce07e74fcf5c370")

artists = RSpotify::Artist.search("drake")
drake = artists.first
# drake = artists.first
# drake.top_tracks(:US)
# top_tracks = RSpotify::Artist.top_tracks(:US)

# albums = RSpotify::Album.new_releases(country: 'US', limit: 100)



# /v1/tracks

# /v1/tracks/{id}

# api_resp = RestClient.get("theaudiodb.com/api/v1/json/1/track.php?h=35027980")
# api_data = JSON.parse(api_resp)



# music_vid = api_data["track"][0]["strMusicVid"]    #example of setting to variable for easier access
binding.pry