# frozen_string_literal: true

module RulebricksApiClient
  module Users
# System or custom role ID to assign to the user. Available system roles include
#  'admin', 'editor', and 'developer'.
    class UserInviteRequestRole

      ADMIN = "admin"
      EDITOR = "editor"
      DEVELOPER = "developer"
      CUSTOM_ROLE = "custom-role"

    end
  end
end