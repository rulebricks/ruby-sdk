# frozen_string_literal: true

module Rulebricks
  module Types
    # Response after successfully creating a user.
    class CreateUserResponse < Internal::Types::Model
      field :status, -> { String }, optional: true, nullable: false
      field :message, -> { String }, optional: true, nullable: false
      field :user, -> { Rulebricks::Types::CreateUserResponseUser }, optional: true, nullable: false
    end
  end
end
