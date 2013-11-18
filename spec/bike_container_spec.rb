require "./lib/bike_container"

class ContainerHolder; include BikeContainer; end

describe BikeContainer do
	
	def fill_station(holder)
		20.times {holder.dock(bike)}
	end

	let(:bike) {Bike.new}
	let(:holder) {ContainerHolder.new}

	it "should accept a bike" do
		expect(holder.bike_count).to eq(0)
		holder.dock(bike)
		expect(holder.bike_count).to eq(1)
	end

	it "should release a bike" do
		holder.dock(bike)
		holder.release(bike)
		expect(holder.bike_count).to eq(0)
	end

	it "should know when its full" do
		expect(holder).not_to be_full
		fill_station(holder)
		expect(holder).to be_full
	end

	it "should not accept bikes when full" do
		fill_station(holder)
		expect {holder.dock(bike)}.to raise_error(RuntimeError)
	end

	it "should provide a list of all available bikes" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([working_bike])
	end
end