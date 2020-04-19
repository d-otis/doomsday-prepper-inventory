class ApplicationController < Sinatra::Base

	configure do
		set :views, "app/views"
		enable :sessions
		set :session_secret, SECRET
	end

	get "/" do
		"Root Route"
	end

end