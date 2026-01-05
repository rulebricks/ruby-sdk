# frozen_string_literal: true

module Rulebricks
  module Users
    module Types
      class CreateUserRequest < Internal::Types::Model
        field :email, -> { String }, optional: false, nullable: false
        field :password, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :role, -> { String }, optional: true, nullable: false
        field :user_groups, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      end
    end
  end
end
