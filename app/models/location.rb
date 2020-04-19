class Location < ActiveRecord::Base

	has_many :location_items
	has_many :items, through: :location_items

	def slug
		name.downcase.gsub(/[!?@ +,&]/, "-").gsub(/[().']/, "").gsub("$", "s").squeeze("-")
	end

	def find_by_slug(slug)
		self.all.find {|instance| instance.slug == slug} 
	end

end