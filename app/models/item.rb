class Item < ActiveRecord::Base

	has_many :location_items
	has_many :locations, through: :location_items

	validates :name, presence: true

	def slug
		name.downcase.gsub(/[!?@ +,&]/, "-").gsub(/[().']/, "").gsub("$", "s").squeeze("-")
	end

	def self.find_by_slug(slug)
		self.all.find {|instance| instance.slug == slug} 
	end

	def item_count(location)
		if self.locations.include?(location)
			self.location_items.find_by(location: location).item_count
		end
	end

	def item_par(location)
		self.location_items.find_by(location: location)&.item_par
	end

	def li_id(item_id, location_id) 
		if self.location_items.find_by(item_id: item_id, location_id: location_id)
			self.location_items.find_by(item_id: item_id, location_id: location_id).id
		end
	end

end