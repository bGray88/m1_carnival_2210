# frozen_string_literal: true

require_relative '../lib/ride'
require_relative '../lib/visitor'
require 'rspec'

describe Ride do
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
      expect(ride1).to be_instance_of(Ride)
      expect(ride1.name).to eq('Carousel')
      expect(ride1.min_height).to eq(24)
      expect(ride1.admission_fee).to eq(1)
      expect(ride1.excitement).to eq(:gentle)
      expect(ride1.total_revenue).to eq(0)
      expect(ride1.rider_log).to eq({})
    end
  end

  describe '#board_rider' do
    it 'adds visitor to the rider_log' do
      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      visitor2.add_preference(:thrilling)
      visitor3.add_preference(:thrilling)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)

      expect(ride1.rider_log.keys[0]).to eq(visitor1)
      expect(ride1.rider_log.values[0]).to eq(1)
    end
  end

  describe '#pay_to_ride' do
    it 'charges the rider for admission' do
      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      visitor2.add_preference(:thrilling)
      visitor3.add_preference(:thrilling)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor2)

      expect(ride1.rider_log.keys[0]).to eq(visitor1)
      expect(ride1.rider_log.values[0]).to eq(1)
      expect(visitor1.spending_money).to eq(9)
      expect(visitor2.spending_money).to eq(3)
    end
  end

  describe '#total_revenue' do
    it 'provides the calculated total revenue for the ride' do
      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      visitor2.add_preference(:thrilling)
      visitor3.add_preference(:thrilling)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor2)

      expect(ride1.total_revenue).to eq(3)
    end
  end

  describe '#valid_rider' do
    it 'checks qualifying attributes for rider against ride' do
      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      visitor2.add_preference(:thrilling)
      visitor3.add_preference(:thrilling)

      expect(ride1.valid_rider(visitor1)).to eq(true)
      expect(ride3.valid_rider(visitor1)).to eq(false)
    end
  end

  describe '#popularity' do
    it 'returns the total ride count for a ride' do
      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      visitor2.add_preference(:thrilling)
      visitor3.add_preference(:thrilling)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor2)
      ride2.board_rider(visitor1)

      expect(ride1.popularity).to eq(3)
      expect(ride3.popularity).to eq(0)
      expect(ride2.popularity).to eq(1)
    end
  end
end
