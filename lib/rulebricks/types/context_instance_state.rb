# frozen_string_literal: true

module Rulebricks
  module Types
    # The current state of a context instance.
    class ContextInstanceState < Internal::Types::Model
      field :context, -> { String }, optional: true, nullable: false
      field :state, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :derived, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :status, -> { Rulebricks::Types::ContextInstanceStateStatus }, optional: true, nullable: false
      field :have, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :need, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
      field :expires_at, -> { String }, optional: true, nullable: false
    end
  end
end
