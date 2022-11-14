# frozen_string_literal: true

require_relative '../lib/visitor'
require 'rspec'

describe Visitor do
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
      expect(visitor1).to be_instance_of(Visitor)
      expect(visitor1.name).to eq('Bruce')
      expect(visitor1.height).to eq(54)
      expect(visitor1.spending_money).to eq(10)
      expect(visitor1.preferences).to eq([])
    end
  end

  describe '#dd_preference' do
    it 'adds symbol preference to visitor collection' do
      visitor1.add_preference(:gentle)
      visitor1.add_preference(:water)

      expect(visitor1.preferences).to eq([:gentle, :water])
    end
  end

  describe '#tall_enough' do
    it 'checks visitor height for threshold requirement' do
      expect(visitor1.tall_enough(54)).to be(true)
      expect(visitor2.tall_enough(54)).to be(false)
      expect(visitor3.tall_enough(54)).to be(true)
      expect(visitor1.tall_enough(64)).to be(false)
    end
  end

  describe '#spend_money' do
    it 'decreases the amount of spending money a visitor has by amount' do
      visitor1.spend_money(2)
      
      expect(visitor1.spending_money).to eq(8)

      visitor1.spend_money(10)

      expect(visitor1.spending_money).to eq(8)
    end
  end

  describe '#interested?' do
    it 'checks preferences against excitement level returns boolean if included' do
      expect(visitor1.interested?(ride1)).to be true
      expect(visitor3.interested?(ride3)).to be true
      expect(visitor1.interested?(ride3)).to be false
    end
  end
end