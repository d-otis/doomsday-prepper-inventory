class Item < ActiveRecord::Base

	has_many :location_items
	has_many :locations, through: :location_items

end