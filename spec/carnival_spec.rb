# frozen_string_literal: true

require_relative '../lib/ride'
require_relative '../lib/visitor'
require_relative '../lib/carnival'
require 'rspec'

describe Carnival do
  let(:carnival) { Carnival.new }
  let(:ride1)    {
                   Ride.new({
                              name: 'Carousel',
                              min_height: 24,
                              admission_fee: 1,
                              excitement: :gentle
                            })
                  }
  let(:ride2)    {
                    Ride.new({
                               name: 'Ferris Wheel',
                               min_height: 36,
                               admission_fee: 5,
                               excitement: :gentle
                             })
                   }
  let(:ride3)    {
                    Ride.new({
                               name: 'Roller Coaster',
                               min_height: 54,
                               admission_fee: 2,
                               excitement: :thrilling
                             })
                   }
  let(:visitor1) { Visitor.new('Bruce',  54, '$10') }
  let(:visitor2) { Visitor.new('Tucker', 36, '$5') }
  let(:visitor3) { Visitor.new('Penny',  64, '$15') }

  describe '#initialize' do
    it 'exists and has attributes' do
      expect(carnival).to be_instance_of(Carnival)
      expect(carnival.duration).to be(10)
      expect(carnival.rides).to eq([])
    end
  end

  describe '#add_ride' do
    it 'adds a ride to the rides collection' do
      carnival.add_ride(ride1)
      carnival.add_ride(ride2)

      expect(carnival.rides).to eq([ride1, ride2])
    end
  end

  describe '#most_popular_ride' do
    it 'returns the ride object(s) at the top of the list for ride count' do
      carnival.add_ride(ride1)
      carnival.add_ride(ride2)

      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      visitor2.add_preference(:thrilling)
      visitor3.add_preference(:thrilling)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor2)
      ride2.board_rider(visitor1)

      expect(carnival.most_popular_ride).to eq([ride1])

      ride2.board_rider(visitor1)
      ride2.board_rider(visitor1)

      expect(carnival.most_popular_ride.length).to be(2)
    end
  end

  describe '#tie' do
    it 'tests group of rides for equality and returns boolean' do
      carnival.add_ride(ride1)
      carnival.add_ride(ride2)

      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      visitor2.add_preference(:thrilling)
      visitor3.add_preference(:thrilling)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor2)
      ride2.board_rider(visitor1)

      rides = [ride1.popularity, ride2.popularity]

      expect(carnival.tie?(rides)).to be(false)

      ride2.board_rider(visitor1)
      ride2.board_rider(visitor1)

      rides = [ride1.popularity, ride2.popularity]

      expect(carnival.tie?(rides)).to be(true)
    end
  end

  describe '#most_profitable ride' do
    it 'returns the ride that is most profitable' do
      carnival.add_ride(ride1)
      carnival.add_ride(ride2)

      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      visitor2.add_preference(:thrilling)
      visitor3.add_preference(:thrilling)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor2)
      ride2.board_rider(visitor1)

      expect(carnival.most_profitable_ride.length).to be(1)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor1)

      expect(carnival.most_profitable_ride.length).to be(2)
    end
  end

  describe '#total_revenue_all' do
    it 'returns the total revenue from all rides at carnival' do
      carnival.add_ride(ride1)
      carnival.add_ride(ride2)

      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      visitor2.add_preference(:thrilling)
      visitor3.add_preference(:thrilling)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor2)
      ride2.board_rider(visitor1)

      expect(carnival.total_revenue_all).to be(8)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor1)

      expect(carnival.total_revenue_all).to be(10)
    end
  end

  # describe '#visitor_count' do
  #   it 'returns total count of ride visitors' do
  #     visitor1.add_preference(:gentle)
  #     visitor2.add_preference(:gentle)
  #     visitor2.add_preference(:thrilling)
  #     visitor3.add_preference(:thrilling)

  #     ride1.board_rider(visitor1)
  #     ride1.board_rider(visitor2)
  #     ride1.board_rider(visitor2)
  #     ride2.board_rider(visitor1)

  #     expect(ride1.popularity).to eq(3)
  #     expect(ride3.popularity).to eq(0)
  #     expect(ride2.popularity).to eq(1)

  #     expect(carnival.visitor_count).to eq(2)
  #   end
  # end

  # describe '#summary' do
  #   it 'provides a breakdown of carnival results' do
      
  #   end
  # end
end
