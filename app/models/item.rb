class Item < ActiveRecord::Base

	has_many :location_items, :dependent => :destroy
	has_many :locations, through: :location_items
	belongs_to :user

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

	def total
		LocationItem.where("item_id = ?", self.id).collect(&:item_count).reduce(:+)
	end

	def under_amount
		if par_total && par_total != 0
			par_total - total > 0 ? "<span class='badge badge-pill badge-danger'>#{par_total - total}</span>" : "<span class='badge badge-pill badge-success'>Stocked</span>"
		else
			"<span class='badge badge-pill badge-warning'>Not set</span>"
		end
	end

	def par_total
		LocationItem.where("item_id = ?", self.id).collect(&:item_par).reduce(:+)
	end

	def self.under_location_items
		LocationItem.where("under = 't'").order(item_id: :asc)
	end

	def under?
		par_total - total > 0
	end

	def print_locations(opts = {})
		if opts[:links] == true
			self.locations.collect {|location| "<a href=\"/locations/#{location.slug}\">#{location.name}</a>"}.join(", ")
		elsif opts[:links] == false
			self.locations.collect {|location| "#{location.name}"}.join(", ")
		elsif opts[:links] == "index"
			self.locations.collect {|location| "<a href=\"/locations\">#{location.name}</a>"}.join(", ")
		end
	end

end