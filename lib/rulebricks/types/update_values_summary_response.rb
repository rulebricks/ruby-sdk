# frozen_string_literal: true

module Rulebricks
  module Types
    # Summary counts returned by value writes when the workspace catalog is too large to echo back in full.
    class UpdateValuesSummaryResponse < Internal::Types::Model
      field :created, -> { Integer }, optional: true, nullable: false

      field :updated, -> { Integer }, optional: true, nullable: false

      field :processed, -> { Integer }, optional: true, nullable: false
    end
  end
end
