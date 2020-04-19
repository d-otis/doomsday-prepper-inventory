ENV["SINATRA_ENV"] ||= "development"

require_relative "./config/environment"

require "sinatra/activerecord/rake"

def reload!
	reload_all "app"
end

task :console do
	Pry.start
end

