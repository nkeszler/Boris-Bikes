require 'garage'

describe Garage do 

	let(:garage) {Garage.new}

	it "Should initialize with a capacity of 200 bikes" do
		expect(garage.capacity).to eq(200)
	end

	it "Should accept all bikes from a van" do
		van = Van.new 
		5.times do
			bike = Bike.new
			bike.break
			van.dock(bike)
		end
		garage.get_all_broken_bikes(van)
		expect(garage.bike_count).to eq(5)
		expect(van.bike_count).to eq(0)
	end

	it "Should fix all broken bikes" do
		5.times do
			bike = Bike.new
			bike.break
			garage.dock(bike)
		end
		garage.fix_bikes
		expect(garage.broken_bikes.count).to eq(0)
		expect(garage.available_bikes.count).to eq(5)
	end

end