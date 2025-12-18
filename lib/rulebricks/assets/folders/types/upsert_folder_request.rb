# frozen_string_literal: true

module Rulebricks
  module Assets
    module Folders
      module Types
        class UpsertFolderRequest < Internal::Types::Model
          field :id, -> { String }, optional: true, nullable: false
          field :name, -> { String }, optional: false, nullable: false
          field :description, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
