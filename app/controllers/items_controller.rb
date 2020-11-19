class ItemsController < ApplicationController

	get "/items" do
		if logged_in?
			@items = Item.where(user: current_user).order(name: :asc)
			@title = "Items"
			
			erb :"/items/index"
		else
			redirect "/login"
		end
	end

	get "/items/new" do
		if logged_in?
			@locations = Location.where(user: current_user)
			@title = "Add New Item"

			erb :"/items/new"
		else
			redirect "/login"
		end
	end

	post "/items" do
		if logged_in?
			item = Item.new(params[:item])
			item.user = current_user

			if item.save
				flash[:message] = "#{item.name} created!"

				redirect "/items"
			else
				flash[:message] = item.errors.messages.collect {|k,v| "#{k.to_s.capitalize} #{v.join}"}

				redirect "/items/new"
			end
		else
			redirect "/login"
		end
	end

	get "/items/shopping-list" do
		if logged_in?
			@items = Item.where(user: current_user).order(name: :asc).select {|item| item.under?}
			@title = "Shopping List"
			erb :"/items/shopping-list"
		else
			redirect "/login"
		end
	end

	get "/items/:slug/edit" do
		if logged_in?
			@item = Item.find_by_slug(params[:slug])
			@locations = Location.where(user: current_user)
			@title = "Edit or Reassign Item"

			erb :"/items/edit"
		else
			redirect "/login"
		end
	end

	patch "/items/:slug" do
		if logged_in?
			item = Item.find_by_slug(params[:slug])
			slug = item.slug

			if item.update(params[:item])
				flash[:message] = "#{item.name} successfully updated!"
				redirect "/items"
			else
				flash[:message] = "Item update error, please try again."
				redirect "/items/#{slug}/edit"
			end
		else
			redirect "/login"
		end
	end

	delete "/items/:slug" do
		if logged_in?
			item = Item.find_by_slug(params[:slug])

			item.destroy

			flash[:message] = "Item successfully deleted."

			redirect "/items"
		else
			redirect "/login"
		end
	end

 end