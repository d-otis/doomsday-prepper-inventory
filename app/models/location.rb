class Location < ActiveRecord::Base

	has_many :location_items
	has_many :items, through: :location_items

	def slug
		name.downcase.gsub(/[!?@ +,&]/, "-").gsub(/[().']/, "").gsub("$", "s").squeeze("-")
	end

	def self.find_by_slug(slug)
		self.all.find {|instance| instance.slug == slug} 
	end

	def first?
		self == Location.first
	end

end