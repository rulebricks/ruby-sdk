# frozen_string_literal: true

module Rulebricks
  module Types
    class CreateTestRequest < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :request, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
      field :response, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
      field :critical, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
