# frozen_string_literal: true

module Rulebricks
  module Types
    class CreateUserResponseUser < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :email, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :role, -> { String }, optional: true, nullable: false
      field :access_groups, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "accessGroups"
      field :api_key, -> { String }, optional: true, nullable: false, api_name: "apiKey"
    end
  end
end
