class LocationsController < ApplicationController

	get "/locations" do
		@locations = Location.all

		erb :"/locations/index"
	end

	get "/locations/:slug/edit" do
		@location = Location.find_by_slug(params[:slug])
		@location_items = LocationItem.where(location: @location)
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
		
		params[:location_items].first.each do |l_i|
			if l_i.first.to_i > 0 && !l_i.last.values.any?(&:empty?)
				LocationItem.find(l_i.first).update(l_i.last)
			end
		end

		redirect "/locations/#{location.slug}"
	end
end