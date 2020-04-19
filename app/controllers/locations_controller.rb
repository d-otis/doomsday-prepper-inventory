class LocationsController < ApplicationController

	get "/locations" do
		@locations = Location.all

		erb :"/locations/index"
	end
end