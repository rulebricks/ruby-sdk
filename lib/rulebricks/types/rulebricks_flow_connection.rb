# frozen_string_literal: true

module Rulebricks
  module Types
    # A directed connection between two node refs. Data connections carry a property from `output` to `input`; control
    # connections (`control: true`) gate the target on a Continue If.
    class RulebricksFlowConnection < Internal::Types::Model
      field :from, -> { String }, optional: false, nullable: false

      field :to, -> { String }, optional: false, nullable: false

      field :output, -> { String }, optional: true, nullable: false

      field :input, -> { String }, optional: true, nullable: false

      field :control, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
