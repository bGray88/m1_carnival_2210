# frozen_string_literal: true

require_relative '../lib/ride'
require_relative '../lib/visitor'
require 'rspec'

describe Ride do
  let(:ride1)    { Ride.new() }
  let(:visitor1) { Visitor.new('Bruce',  54, '$10') }
  let(:visitor2) { Visitor.new('Tucker', 36, '$5') }
  let(:visitor3) { Visitor.new('Penny',  64, '$15') }

  describe '#initialize' do
    it 'exists and has attributes' do
      
    end
  end
end
