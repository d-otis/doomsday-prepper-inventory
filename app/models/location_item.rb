class LocationItem < ActiveRecord::Base
	belongs_to :item
	belongs_to :location
end