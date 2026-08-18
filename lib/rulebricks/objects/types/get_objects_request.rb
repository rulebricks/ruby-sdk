# frozen_string_literal: true

module Rulebricks
  module Objects
    module Types
      class GetObjectsRequest < Internal::Types::Model
        field :object_id_, -> { String }, optional: false, nullable: false, api_name: "objectId"
      end
    end
  end
end
