require 'docking_station'

describe DockingStation do

	let(:bike) {Bike.new}
	let(:station) {DockingStation.new(:capacity => 20)}

	it "should allow setting default capacity" do
		expect(station.capacity).to eq(20)
	end

	it "should take all 5 fixed bikes from van" do
		van = Van.new
		5.times do
			bike = Bike.new
			van.dock(bike)
		end
		station.get_all_working_bikes(van)
		expect(station.bike_count).to eq(5)
		expect(van.bike_count).to eq(0)
	end
end