require_relative "bike_container"
require 'bike'

class Van

	include BikeContainer

	def initialize
		self.capacity = 5
	end

end