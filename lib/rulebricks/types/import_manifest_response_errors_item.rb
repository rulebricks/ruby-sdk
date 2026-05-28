# frozen_string_literal: true

module Rulebricks
  module Types
    class ImportManifestResponseErrorsItem < Internal::Types::Model
      field :type, -> { String }, optional: true, nullable: false

      field :stable_id, -> { String }, optional: true, nullable: false

      field :status, -> { String }, optional: true, nullable: false

      field :reason, -> { String }, optional: true, nullable: false
    end
  end
end
