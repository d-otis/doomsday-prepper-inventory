class Location < ActiveRecord::Base

	has_many :location_items
	has_many :items, through: :location_items

end