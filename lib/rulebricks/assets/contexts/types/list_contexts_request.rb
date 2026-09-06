# frozen_string_literal: true

module Rulebricks
  module Assets
    module Contexts
      module Types
        class ListContextsRequest < Internal::Types::Model
          field :limit, -> { Integer }, optional: true, nullable: false

          field :cursor, -> { String }, optional: true, nullable: false

          field :folder, -> { String }, optional: true, nullable: false

          field :user_group, -> { String }, optional: true, nullable: false

          field :name, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
