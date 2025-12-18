# frozen_string_literal: true

module Rulebricks
  module Types
    # Response containing decision logs or a count.
    class DecisionLogResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Rulebricks::Types::DecisionLog] }, optional: true, nullable: false
      field :cursor, -> { String }, optional: true, nullable: false
      field :count, -> { Integer }, optional: true, nullable: false
    end
  end
end
