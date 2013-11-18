require_relative 'bike_container'
require "van"

class Garage

	include BikeContainer

	def initialize
		self.capacity = 200
	end

	def fix_bikes
		while self.broken_bikes.count > 0
			broken_bikes[0].fix
		end
	end
end