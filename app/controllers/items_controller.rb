class ItemsController < ApplicationController

	get "/items" do
		"items index"
	end

	get "/items/new" do
		"new items route"
	end
end