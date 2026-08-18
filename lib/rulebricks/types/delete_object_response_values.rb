# frozen_string_literal: true

module Rulebricks
  module Types
    class DeleteObjectResponseValues < Internal::Types::Model
      field :detached, -> { Integer }, optional: true, nullable: false

      field :archived, -> { Integer }, optional: true, nullable: false
    end
  end
end
