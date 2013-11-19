require "person"

describe Person do

	let(:person) {Person.new('nicki')}
	let(:bike) {Bike.new}
	
	it "Should initialize with a given name" do
		expect(person.name).to eq('nicki')
	end

	it "Should be able to rent a bike" do
		person.rent(bike)
		expect(person.has_bike?).to be_true
		expect(person.bike).to eq(bike)
	end

	it "Should be able to return a bike" do
		station = DockingStation.new
		person.rent(bike)
		person.return_to(station)
		expect(person.bike).to eq(nil)
		expect(person.has_bike?).not_to be_true
		expect(station.bike_count).to eq(1)
	end

	it "Should be able to break a bike" do
		person.rent(bike)
		person.break_bike
		expect(person.bike.broken?).to be_true
	end

end