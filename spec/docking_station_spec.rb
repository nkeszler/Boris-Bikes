require 'docking_station'

describe DockingStation do

	def fill_station(station)
		20.times {station.dock(bike)}
	end

	let(:bike) {Bike.new}
	let(:station) {DockingStation.new(:capacity => 20)}

	it "should allow setting default capacity" do
		expect(station.capacity).to eq(20)
	end
end