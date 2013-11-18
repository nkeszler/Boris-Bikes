require 'van'

describe Van do

	let(:van) {Van.new}
	
	it "Should initailize with default capacity of 5 bikes" do
		expect(van.capacity).to eq(5)
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

	it "Should grab as many broken bikes as possible even if some working ones are available" do
		docking_station = DockingStation.new
		5.times do
			bike = Bike.new
			docking_station.dock(bike)
		end
		5.times do
			bike = Bike.new
			bike.break
			docking_station.dock(bike)
		end
		van.get_all_broken_bikes(docking_station)
		expect(van).to be_full
	end

	it "Should grab as many fixed bikes from garage as possible" do
		garage = Garage.new
		6.times do
			bike = Bike.new
			garage.dock(bike)
		end
		van.get_all_working_bikes(garage)
		expect(garage.bike_count).to eq(1)
		expect(van.bike_count).to eq(5)
	end

end