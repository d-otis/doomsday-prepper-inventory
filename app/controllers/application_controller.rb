class ApplicationController < Sinatra::Base
	use Rack::Flash

	configure do
		set :views, "app/views"
		enable :sessions
		set :session_secret, SECRET
	end

	get "/" do
		"Root Route"
	end

end