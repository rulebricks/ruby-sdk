# frozen_string_literal: true

module Rulebricks
  module Types
    # A declared output of a dynamic node (code/api/db/soap/ai/for_each). Declaring outputs lets the expander render the
    # output handle and keep generated connections.
    class RulebricksFlowOutputField < Internal::Types::Model
      field :key, -> { String }, optional: false, nullable: false

      field :type, -> { Rulebricks::Types::RulebricksFlowOutputFieldType }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
