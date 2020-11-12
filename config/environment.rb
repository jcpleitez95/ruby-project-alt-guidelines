require 'bundler/setup'
require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'

RSpotify.authenticate("c95094077b534f878a9eeb73a36f8f0d", "7b039970587b4751bfd8c22363eddcdd")
