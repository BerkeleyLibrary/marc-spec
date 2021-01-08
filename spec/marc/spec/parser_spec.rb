require 'spec_helper'

module MARC
  module Spec
    describe Parser do
      let(:parser) { Parser.new }

      it 'is a parser' do
        expect(parser).to be_a(Parslet::Parser)
      end
    end
  end
end
