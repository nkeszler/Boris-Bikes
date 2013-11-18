module BikeContainer

	DEFAULT_CAPACITY = 20

	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def bike_count
		bikes.count
	end

	def raise_error_if_cannot_accept(bike)
		raise_if_full
	end

	def raise_if_full
		raise "Station is full" if full?
	end

	def dock(bike)
		raise_error_if_cannot_accept(bike)
		bikes << bike
	end

	def release(bike)
		bikes.slice!(bikes.index(bike))
	end

	def full?
		bike_count == capacity
	end

	def available_bikes
		bikes.reject {|bike| bike.broken?}
	end

	def broken_bikes
		bikes.reject {|bike| !bike.broken?}
	end

	def get_all_broken_bikes(container)
		while !self.full? && container.bike_count > 0
			self.dock(container.release(container.broken_bikes.first))
		end
	end

	def get_all_working_bikes(container)
		while !self.full? && container.bike_count > 0
			self.dock(container.release(container.available_bikes.first))
		end
	end
end