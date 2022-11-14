# frozen_string_literal: true

require_relative '../lib/visitor'

describe Visitor do
  
  let(:visitor1) { Visitor.new('Stella', '5\'6\"') }

  describe '#initialize' do
    it 'exists and has attributes' do
      expect(visitor1).to be_instance_of(Visitor)
      expect(visitor1.name).to eq('Stella')
      expect(visitor1.height).to eq('5\'6\"')
    end
  end
end