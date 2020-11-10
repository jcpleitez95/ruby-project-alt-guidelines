require 'pry'
require 'json'
require 'rspotify'

Song.destroy_all
User.destroy_all
Playlist.destroy_all

RSpotify.authenticate("c95094077b534f878a9eeb73a36f8f0d", "32f89fc427dd464d9ce07e74fcf5c370")

def search_artist(name)
    artist = RSpotify::Artist.search(name)
    result = artist.first
end

jb = search_artist("Justin Bieber").top_tracks(:US).map {|s| [s.name, s.preview_url]}
jb.each {|song| Song.create(title: song[0], artist: "Justin Bieber", genre: "Pop", preview_url: song[1])}

tw = search_artist("The Weekend").top_tracks(:US).map {|s| [s.name, s.preview_url]}
tw.each {|song| Song.create(title: song[0], artist: "The Weeknd", genre: "Pop", preview_url: song[1])}

ag = search_artist("Ariana Grande").top_tracks(:US).map {|s| [s.name, s.preview_url]}
ag.each {|song| Song.create(title: song[0], artist: "Ariana Grande", genre: "Pop", preview_url: song[1])}

drake = search_artist("Drake").top_tracks(:US).map {|s| [s.name, s.preview_url]}
drake.each {|song| Song.create(title: song[0], artist: "Drake", genre: "Hip Hop", preview_url: song[1])}

dl = search_artist("Dua Lipa").top_tracks(:US).map {|s| [s.name, s.preview_url]}
dl.each {|song| Song.create(title: song[0], artist: "Dua Lipa", genre: "Pop", preview_url: song[1])}

jbal = search_artist("J Balvin").top_tracks(:US).map {|s| [s.name, s.preview_url]}
jbal.each {|song| Song.create(title: song[0], artist: "J Balvin", genre: "Latin", preview_url: song[1])}

es = search_artist("Ed Sheeran").top_tracks(:US).map {|s| [s.name, s.preview_url]}
es.each {|song| Song.create(title: song[0], artist: "Ed Sheeran", genre: "Pop", preview_url: song[1])}

khal = search_artist("Khalid").top_tracks(:US).map {|s| [s.name, s.preview_url]}
khal.each {|song| Song.create(title: song[0], artist: "Khalid", genre: "R&B", preview_url: song[1])}

marsh = search_artist("Marshmello").top_tracks(:US).map {|s| [s.name, s.preview_url]}
marsh.each {|song| Song.create(title: song[0], artist: "Marshmello", genre: "Techno", preview_url: song[1])}

cb = search_artist("Cardi B").top_tracks(:US).map {|s| [s.name, s.preview_url]}
cb.each {|song| Song.create(title: song[0], artist: "Cardi B", genre: "Hip Hop", preview_url: song[1])}

jd = search_artist("Jason Derulo").top_tracks(:US).map {|s| [s.name, s.preview_url]}
jd.each {|song| Song.create(title: song[0], artist: "Jason Derulo", genre: "Pop", preview_url: song[1])}

sm = search_artist("Shawn Mendes").top_tracks(:US).map {|s| [s.name, s.preview_url]}
sm.each {|song| Song.create(title: song[0], artist: "Shawn Mendes", genre: "Pop", preview_url: song[1])}

bb = search_artist("Bad Bunny").top_tracks(:US).map {|s| [s.name, s.preview_url]}
bb.each {|song| Song.create(title: song[0], artist: "Bad Bunny", genre: "Latin", preview_url: song[1])}

m5 = search_artist("Maroon 5").top_tracks(:US).map {|s| [s.name, s.preview_url]}
m5.each {|song| Song.create(title: song[0], artist: "Maroon 5", genre: "Pop", preview_url: song[1])}

hals = search_artist("Halsey").top_tracks(:US).map {|s| [s.name, s.preview_url]}
hals.each {|song| Song.create(title: song[0], artist: "Halsey", genre: "Pop", preview_url: song[1])}

lg = search_artist("Lady Gaga").top_tracks(:US).map {|s| [s.name, s.preview_url]}
lg.each {|song| Song.create(title: song[0], artist: "Lady Gaga", genre: "Pop", preview_url: song[1])}

pm = search_artist("Post Malone").top_tracks(:US).map {|s| [s.name, s.preview_url]}
pm.each {|song| Song.create(title: song[0], artist: "Post Malone", genre: "Pop", preview_url: song[1])}

ts = search_artist("Travis Scott").top_tracks(:US).map {|s| [s.name, s.preview_url]}
ts.each {|song| Song.create(title: song[0], artist: "Travis Scott", genre: "Hip Hop", preview_url: song[1])}

nm = search_artist("Nicki Minaj").top_tracks(:US).map {|s| [s.name, s.preview_url]}
nm.each {|song| Song.create(title: song[0], artist: "Nick Minaj", genre: "Hip Hop", preview_url: song[1])}

hs = search_artist("Harry Styles").top_tracks(:US).map {|s| [s.name, s.preview_url]}
hs.each {|song| Song.create(title: song[0], artist: "Harry Styles", genre: "Pop", preview_url: song[1])}

yook = search_artist("Yookie").top_tracks(:US).map {|s| [s.name, s.preview_url]}
yook.each {|song| Song.create(title: song[0], artist: "YOOKiE", genre: "Techno", preview_url: song[1])}

guay = search_artist("Guaynaa").top_tracks(:US).map {|s| [s.name, s.preview_url]}
guay.each {|song| Song.create(title: song[0], artist: "Guaynaa", genre: "Latin", preview_url: song[1])}

mm = search_artist("Machel Montano").top_tracks(:US).map {|s| [s.name, s.preview_url]}
mm.each {|song| Song.create(title: song[0], artist: "Machel Montano", genre: "Soca", preview_url: song[1])}

sf = search_artist("Skinny Fabulous").top_tracks(:US).map {|s| [s.name, s.preview_url]}
sf.each {|song| Song.create(title: song[0], artist: "Skinny Fabulous", genre: "Soca", preview_url: song[1])}

spp = search_artist("Scarypoolparty").top_tracks(:US).map {|s| [s.name, s.preview_url]}
spp.each {|song| Song.create(title: song[0], artist: "Scarypoolparty", genre: "Indie", preview_url: song[1])}

kes = search_artist("Kes the Band").top_tracks(:US).map {|s| [s.name, s.preview_url]}
kes.each {|song| Song.create(title: song[0], artist: "Kes", genre: "Soca", preview_url: song[1])}

lyr = search_artist("Lyrikal").top_tracks(:US).map {|s| [s.name, s.preview_url]}
lyr.each {|song| Song.create(title: song[0], artist: "Lyrikal", genre: "Soca", preview_url: song[1])}

tr = search_artist("Teodoro Reyes").top_tracks(:US).map {|s| [s.name, s.preview_url]}
tr.each {|song| Song.create(title: song[0], artist: "Teodoro Reyes", genre: "Latin", preview_url: song[1])}

as = search_artist("Anthony Santos").top_tracks(:US).map {|s| [s.name, s.preview_url]}
as.each {|song| Song.create(title: song[0], artist: "Anthony Santos", genre: "Latin", preview_url: song[1])}

ti = search_artist("Tame Impala").top_tracks(:US).map {|s| [s.name, s.preview_url]}
ti.each {|song| Song.create(title: song[0], artist: "Tame Impala", genre: "Indie", preview_url: song[1])}

ce = search_artist("Cage The Elephant").top_tracks(:US).map {|s| [s.name, s.preview_url]}
ce.each {|song| Song.create(title: song[0], artist: "Cage The Elephant", genre: "Rock", preview_url: song[1])}

ez = search_artist("Ezhel").top_tracks(:US).map {|s| [s.name, s.preview_url]}
ez.each {|song| Song.create(title: song[0], artist: "Ezhel", genre: "Hip Hop", preview_url: song[1])}

vf = search_artist("Vicente Fernandez").top_tracks(:US).map {|s| [s.name, s.preview_url]}
vf.each {|song| Song.create(title: song[0], artist: "Vicente Fernandez", genre: "Latin", preview_url: song[1])}

pa = search_artist("Pepe Aguilar").top_tracks(:US).map {|s| [s.name, s.preview_url]}
pa.each {|song| Song.create(title: song[0], artist: "Pepe Aguilar", genre: "Latin", preview_url: song[1])}

dc = search_artist("Daniel Caeser").top_tracks(:US).map {|s| [s.name, s.preview_url]}
dc.each {|song| Song.create(title: song[0], artist: "Daniel Caeser", genre: "R&B", preview_url: song[1])}

mk = search_artist("Mr. Killa").top_tracks(:US).map {|s| [s.name, s.preview_url]}
mk.each {|song| Song.create(title: song[0], artist: "Mr. Killa", genre: "Soca", preview_url: song[1])}

rw = search_artist("Rod Wave").top_tracks(:US).map {|s| [s.name, s.preview_url]}
rw.each {|song| Song.create(title: song[0], artist: "Rod Wave", genre: "Hip Hop", preview_url: song[1])}

giv = search_artist("Giveon").top_tracks(:US).map {|s| [s.name, s.preview_url]}
giv.each {|song| Song.create(title: song[0], artist: "Giveon", genre: "R&B", preview_url: song[1])}

fm = search_artist("Fleetwood Mac").top_tracks(:US).map {|s| [s.name, s.preview_url]}
fm.each {|song| Song.create(title: song[0], artist: "Fleetwood Mac", genre: "Rock", preview_url: song[1])}

tc = search_artist("Tego Calderon").top_tracks(:US).map {|s| [s.name, s.preview_url]}
tc.each {|song| Song.create(title: song[0], artist: "Tego Calderon", genre: "Latin", preview_url: song[1])}







# mike = User.create(name: "Mike") 
# yellow = Song.create(title: "Yellow", artist: "Coldplay", genre: "Pop")
# # mikes_playlist = Playlist.create(name: "Mikes")







binding.pry