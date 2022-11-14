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
      
    end
  end
end
