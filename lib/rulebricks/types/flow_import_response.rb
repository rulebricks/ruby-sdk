# frozen_string_literal: true

module Rulebricks
  module Types
    # Summary of the imported flow.
    class FlowImportResponse < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false

      field :id, -> { String }, optional: true, nullable: false

      field :slug, -> { String }, optional: true, nullable: false
    end
  end
end
