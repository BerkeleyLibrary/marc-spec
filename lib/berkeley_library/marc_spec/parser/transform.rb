require 'parslet'

module BerkeleyLibrary
  module MarcSpec
    # rubocop:disable Style/BlockDelimiters
    class Transform < Parslet::Transform

      rule(field_tag: simple(:field_tag)) { field_tag }

      rule(:position_or_range) # TODO: this
    end
    # rubocop:enable Style/BlockDelimiters
  end
end
