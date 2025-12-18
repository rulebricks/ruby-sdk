# frozen_string_literal: true

module Rulebricks
  module Values
    module Types
      class UpdateValuesRequest < Internal::Types::Model
        field :values, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
        field :access_groups, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "accessGroups"
      end
    end
  end
end
