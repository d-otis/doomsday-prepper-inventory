require 'bundler/setup'
Bundler.require

ENV['RACK_ENV'] ||= "production"

# ActiveRecord::Base.establish_connection(
#   :adapter => "sqlite3",
#   :database => "db/inventory_#{ENV['SINATRA_ENV']}.sqlite"
# )

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

# require_relative "session_secret"

require_all 'app'
