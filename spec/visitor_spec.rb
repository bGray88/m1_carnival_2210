# frozen_string_literal: true

require_relative '../lib/visitor'

describe Visitor do
  
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
end