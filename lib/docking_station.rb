require_relative 'bike_container'

class DockingStation
	
	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def has_broken_bikes?
		self.broken_bikes.count > 0
	end
end