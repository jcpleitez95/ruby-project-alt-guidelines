# class User < ActiveRecord::Base
#     has_many :playlists
    

# end



require "tty-prompt"

class User < ActiveRecord::Base
    has_many :playlists
    @@prompt = TTY::Prompt.new

    def self.signup
        username = @@prompt.ask("What is your name?")
        password = @@prompt.mask("What is your password?")
        age = @@prompt.ask("How old are you?")
        email = @@prompt.ask("What is your email address?")
        User.create(name: username, password: password, age: age, email: email)
        User.login
    end

    def self.login
        username = @@prompt.ask("What is your name?")
        password = @@prompt.mask("What is your password?")
        @user = User.find_by(name: username, password: password)
        if @user
            # self.display_menu
            system ('clear')
        #    User.main_menu
        else 
            puts "Unknown User or Password"
            sleep(1)
            system ('clear')
            CLI.login_menu
        end
    end
end