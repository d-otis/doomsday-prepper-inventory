require 'bundler/setup'
Bundler.require

# ENV['SINATRA_ENV'] ||= "development"

# ActiveRecord::Base.establish_connection(
#   :adapter => "sqlite3",
#   :database => "db/inventory_#{ENV['SINATRA_ENV']}.sqlite"
# )

require_relative "session_secret"

require_all 'app'
