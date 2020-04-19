class LocationsController < ApplicationController

	get "/locations" do
		@locations = Location.all

		erb :"/locations/index"
	end

	get "/locations/:slug/edit" do
		@location = Location.find_by_slug(params[:slug])
		@items = Item.order(name: :asc)

		erb :"/locations/edit"
	end

	get "/locations/:slug" do
		@location = Location.find_by_slug(params[:slug])

		erb :"/locations/show"
	end

	patch "/locations/:slug" do
		location = Location.find_by_slug(params[:slug])
		location.update(params[:location])

		redirect "/locations/#{location.slug}"
	end
end