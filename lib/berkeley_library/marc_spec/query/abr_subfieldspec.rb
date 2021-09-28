module BerkeleyLibrary
  module MarcSpec
    module Query
      class AbrSubfieldspec
        attr_reader :code_range, :code, :index, :character_spec

        def initialize(code_range: nil, code: nil, index: nil, character_spec: nil)
          raise ArgumentError, 'Code or code range must be specified' if [code, code_range].all?(&:nil?)
          raise ArgumentError, 'Code and code range cannot both be specified' if [code, code_range].none?(&:nil?)

          @code_range = code_range
          @code = code
          @index = index
          @character_spec = character_spec
        end
      end
    end
  end
end
