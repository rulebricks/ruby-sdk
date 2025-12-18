# frozen_string_literal: true

module Rulebricks
  module Users
    module Types
      module UserInviteRequestRole
        extend Rulebricks::Internal::Types::Enum

        ADMIN = "admin"
        EDITOR = "editor"
        DEVELOPER = "developer"
        CUSTOM_ROLE = "custom-role"
      end
    end
  end
end
