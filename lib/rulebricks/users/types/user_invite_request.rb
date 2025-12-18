# frozen_string_literal: true

module Rulebricks
  module Users
    module Types
      class UserInviteRequest < Internal::Types::Model
        field :email, -> { String }, optional: false, nullable: false
        field :role, -> { Rulebricks::Users::Types::UserInviteRequestRole }, optional: true, nullable: false
        field :access_groups, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "accessGroups"
      end
    end
  end
end
