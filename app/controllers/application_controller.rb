class ApplicationController < Sinatra::Base
	use Rack::Flash
	register Sinatra::ActiveRecordExtension

	configure do
		set :views, "app/views"
		enable :sessions
		set :session_secret, SECRET
	end

	get "/" do
		erb :index
	end

end