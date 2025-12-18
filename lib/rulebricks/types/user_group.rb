# frozen_string_literal: true

module Rulebricks
  module Types
    class UserGroup < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :members, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
