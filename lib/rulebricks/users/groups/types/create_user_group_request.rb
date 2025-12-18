# frozen_string_literal: true

module Rulebricks
  module Users
    module Groups
      module Types
        class CreateUserGroupRequest < Internal::Types::Model
          field :name, -> { String }, optional: false, nullable: false
          field :description, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
