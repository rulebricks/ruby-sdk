# frozen_string_literal: true

module Rulebricks
  module Contexts
    module Objects
      module Types
        class ListObjectsRequest < Internal::Types::Model
          field :folder, -> { String }, optional: true, nullable: false

          field :user_group, -> { String }, optional: true, nullable: false

          field :name, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
