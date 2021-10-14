require 'spec_helper'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      describe ComparisonString do
        describe :str_exact do
          it 'decodes escapes' do
            expecteds = {
              'value' => 'value',
              '!value' => '!value',
              '\\!value' => '!value',
              '\\svalue' => ' value',
              'value\\!' => 'value!',
              'a\\{b\\}\\$1\\\\23\\=\\~\\|\\?' => 'a{b}$1\\\\23=~|?',
              'help\\sI\\sam\\strapped\\sin\\sa\\sunit\\stest\\!\\sso\\sam\\sI' =>
                'help I am trapped in a unit test! so am I'
            }
            aggregate_failures do
              expecteds.each do |str_raw, expected|
                cstr = ComparisonString.new(str_raw)
                expect(cstr.str_exact).to eq(expected)
              end
            end
          end
        end
      end
    end
  end
end
