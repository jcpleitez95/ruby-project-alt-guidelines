require "tty-prompt"

class User < ActiveRecord::Base
    has_many :playlists
    @@prompt = TTY::Prompt.new

end



