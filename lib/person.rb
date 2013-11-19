class Person

	def initialize(name)
		@name = name
	end

	def name
		@name
	end

	def rent(bike)
		@bike = bike
	end

	def has_bike?
		@bike ? true : false
	end

	def bike
		@bike
	end

	def return_to(station)
		station.dock(self.bike)
		@bike = nil
	end

	def break_bike
		self.bike.break
	end
end