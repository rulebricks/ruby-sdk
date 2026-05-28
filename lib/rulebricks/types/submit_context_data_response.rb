# frozen_string_literal: true

module Rulebricks
  module Types
    # Response after submitting data, including any auto-executed evaluations.
    class SubmitContextDataResponse < Internal::Types::Model
      field :context, -> { String }, optional: true, nullable: false

      field :state, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :status, -> { Rulebricks::Types::SubmitContextDataResponseStatus }, optional: true, nullable: false

      field :have, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :need, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :is_new, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :expires_at, -> { String }, optional: true, nullable: false

      field :cascaded, -> { Internal::Types::Array[Rulebricks::Types::CascadeResult] }, optional: true, nullable: false
    end
  end
end
