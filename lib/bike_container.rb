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
end