class ApplicationController < Sinatra::Base
	use Rack::Flash
	register Sinatra::ActiveRecordExtension

	configure do
		set :views, "app/views"
		enable :sessions
		set :session_secret, SECRET
	end

	get "/" do
		redirect "/items"
	end

	helpers do
		def logged_in?
			!!current_user
		end

		def current_user
			@current_user ||= session[:user_id]
		end
	end

end