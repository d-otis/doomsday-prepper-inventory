class SessionsController < ApplicationController
	get "/login" do
		@title = "Login"
		if !logged_in?
			erb :"/sessions/login"
		else
			redirect "/items"
		end
	end

	post "/login" do
		login(params)

		redirect "/items"
	end

	get "/logout" do
		logout
	end
end