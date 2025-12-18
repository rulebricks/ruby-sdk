# frozen_string_literal: true

module Rulebricks
  module Types
    class FlowDetail < Internal::Types::Model
      field :published, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end
