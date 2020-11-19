class Location < ActiveRecord::Base

	has_many :location_items
	has_many :items, through: :location_items
	belongs_to :user

	validates :name, presence: true

	def slug
		name.downcase.gsub(/[!?@ +,&]/, "-").gsub(/[().']/, "").gsub("$", "s").squeeze("-")
	end

	def self.find_by_slug(slug)
		self.all.find {|instance| instance.slug == slug} 
	end

	def first?
		self == self.user.locations.first
	end

end