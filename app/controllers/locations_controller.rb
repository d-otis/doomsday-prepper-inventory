class LocationsController < ApplicationController

	get "/locations" do
		if logged_in?
			@locations = Location.where(owned_by_current_user)
			@title = "Locations"

			erb :"/locations/index"
		else
			redirect "/login"
		end
	end

	get "/locations/:slug/edit" do
		if logged_in?
			@location = Location.where(owned_by_current_user).find_by_slug(params[:slug])
			@location_items = LocationItem.where(location: @location)
			@items = Item.where(owned_by_current_user).order(name: :asc)
			@title = "Edit Location Items"

			erb :"/locations/edit"
		else
			redirect "/login"
		end
	end

	get "/locations/:slug/assign" do
		if logged_in?
			@location = Location.where(owned_by_current_user).find_by_slug(params[:slug])
			@items = Item.where(owned_by_current_user).order(name: :asc)

			erb :"/locations/assign"
		else
			redirect "/login"
		end
	end

	patch "/locations/:slug/assign" do
		if logged_in?
			location = Location.where(owned_by_current_user).find_by_slug(params[:slug])
			location.update(params[:location])
			redirect "/locations/#{location.slug}"
		else
			redirect "/login"
		end
	end

	get "/locations/:slug" do
		if logged_in?
			@location = Location.where(owned_by_current_user).find_by_slug(params[:slug])
			@title = "#{@location.name} Items"

			erb :"/locations/show"
		else
			redirect "/login"
		end
	end

	patch "/locations/:slug" do
		if logged_in?
			location = Location.where(owned_by_current_user).find_by_slug(params[:slug])
			location.update(params[:location])


			
			params[:location_items].first.each do |l_i|
				if l_i.first.to_i > 0 && !l_i.last.values.any?(&:empty?)
					LocationItem.find(l_i.first).update(l_i.last)
				end
			end

			LocationItem.update_under_status_all

			redirect "/locations/#{location.slug}"
		else
			redirect "/login"
		end
	end
end