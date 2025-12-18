# frozen_string_literal: true

module Rulebricks
  module Types
    class UserInviteResponseUser < Internal::Types::Model
      field :email, -> { String }, optional: true, nullable: false
      field :role, -> { String }, optional: true, nullable: false
      field :access_groups, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "accessGroups"
    end
  end
end
