class ItemsController < ApplicationController

	get "/items" do
		@items = Item.order(name: :asc)
		
		erb :"/items/index"
	end

	get "/items/new" do
		@locations = Location.all

		erb :"/items/new"
	end

	post "/items" do
		item = Item.new(params[:item])

		if item.save
			flash[:message] = "#{item.name} created!"

			redirect "/items"
		else
			flash[:message] = item.errors.messages.collect {|k,v| "#{k.to_s.capitalize} #{v.join}"}

			redirect "/items/new"
		end
	end

	get "/items/shopping-list" do
		@under_location_items = Item.under_items

		erb :"/items/shopping-list"
	end

	get "/items/:slug/edit" do
		@item = Item.find_by_slug(params[:slug])
		@locations = Location.all

		erb :"/items/edit"
	end

	patch "/items/:slug" do
		item = Item.find_by_slug(params[:slug])
		slug = item.slug

		if item.update(params[:item])
			flash[:message] = "#{item.name} successfully updated!"
			redirect "/items"
		else
			flash[:message] = "Item update error, please try again."
			redirect "/items/#{slug}/edit"
		end
	end

	delete "/items/:slug" do
		item = Item.find_by_slug(params[:slug])

		item.destroy

		flash[:message] = "Item successfully deleted."

		redirect "/items"
	end

 end