class User < ActiveRecord::Base
	has_secure_password

	has_many :items
	has_many :locations

	validates :username, presence: true, uniqueness: true
	validates :password, presence: true
	validates_confirmation_of :password, presence: true
end