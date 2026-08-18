# frozen_string_literal: true

module Rulebricks
  module Assets
    module Folders
      module Types
        class ListFoldersRequest < Internal::Types::Model
          field :user_group, -> { String }, optional: true, nullable: false

          field :name, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
