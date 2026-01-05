# frozen_string_literal: true

module Rulebricks
  module Types
    # Detailed information about a user in the organization.
    class UserDetail < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :email, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :api_key, -> { String }, optional: true, nullable: false
      field :role, -> { String }, optional: true, nullable: false
      field :user_groups, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :joined_at, -> { String }, optional: true, nullable: false
    end
  end
end
