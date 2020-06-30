require 'bundler/setup'
Bundler.require

require 'dotenv/load'

ENV['RACK_ENV']

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/inventory_dev')

require_all 'app'
