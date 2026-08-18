# frozen_string_literal: true

module Rulebricks
  module Types
    class RunTestsRequest < Internal::Types::Model
      field :critical_only, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
