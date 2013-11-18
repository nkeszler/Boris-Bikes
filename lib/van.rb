require_relative "bike_container"
require 'bike'

class Van

	include BikeContainer

	def initialize
		self.capacity = 5
	end

	def raise_error_if_cannot_accept(bike)
		raise_if_not_broken(bike)
	end

	def raise_if_not_broken(bike)
		raise "Bike not broken" if !bike.broken?
	end

	def get_all_broken_bikes(docking_station)
		while !self.full?
			self.dock(docking_station.release(docking_station.bikes.first))
		end
	end
end