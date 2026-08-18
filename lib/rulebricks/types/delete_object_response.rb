# frozen_string_literal: true

module Rulebricks
  module Types
    class DeleteObjectResponse < Internal::Types::Model
      field :message, -> { String }, optional: true, nullable: false

      field :values, -> { Rulebricks::Types::DeleteObjectResponseValues }, optional: true, nullable: false
    end
  end
end
