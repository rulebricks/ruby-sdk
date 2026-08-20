# frozen_string_literal: true

module Rulebricks
  module Types
    # The exported rule object containing all rule definition data. This payload intentionally preserves raw rule
    # document casing (for example, `requestSchema`, `sampleRequest`, and `createdAt`) so it can round-trip through
    # `/admin/rules/import` and `.rbm` workflows.
    class RuleExport < Internal::Types::Model
      field :labels, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
