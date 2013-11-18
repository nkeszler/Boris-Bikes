require 'van'

describe Van do

	let(:van) {Van.new}
	
	it "Should initailize with default capacity of 5 bikes" do
		expect(van.capacity).to eq(5)
	end

	it "Should raise error if a working bike is docked" do
		working_bike = Bike.new
		expect {van.dock(working_bike)}.to raise_error(RuntimeError)
	end

	it "Should grab as many broken bikes as possible" do
		docking_station = DockingStation.new
		5.times do
			bike = Bike.new
			bike.break
			docking_station.dock(bike)
		end
		van.get_all_broken_bikes(docking_station)
		expect(van).to be_full
	end
end