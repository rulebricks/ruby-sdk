# frozen_string_literal: true

module Rulebricks
  module Objects
    module Types
      class DeleteObjectsRequest < Internal::Types::Model
        field :object_id_, -> { String }, optional: false, nullable: false, api_name: "objectId"

        field :values, -> { Rulebricks::Objects::Types::DeleteObjectsRequestValues }, optional: true, nullable: false
      end
    end
  end
end
