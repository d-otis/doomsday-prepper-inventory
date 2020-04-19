class ItemsController < ApplicationController

	get "/items" do
		"items index"
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
 end