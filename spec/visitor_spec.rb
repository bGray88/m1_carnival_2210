# frozen_string_literal: true

require_relative '../lib/visitor'

describe Visitor do
  
  let(:visitor1) { Visitor.new('Stella', '5\'6\"', '$10') }

  describe '#initialize' do
    it 'exists and has attributes' do
      expect(visitor1).to be_instance_of(Visitor)
      expect(visitor1.name).to eq('Stella')
      expect(visitor1.height).to eq('5\'6\"')
      expect(visitor1.spending_money).to eq(10)
      expect(visitor1.preferences).to eq([])
    end
  end
end